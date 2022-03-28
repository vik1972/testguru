class TestPassage < ApplicationRecord

  PASSING_SCORE = 85.freeze
  
  belongs_to :current_question, class_name: 'Question', optional: true
  belongs_to :user
  belongs_to :test
  
  before_validation :before_validation_set_question, on: %i[create update]

  def success?
    percent_correct >= PASSING_SCORE
  end
  
  def completed?
    current_question.nil?
  end
  
  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

   def total_test_questions
    test.questions.count
  end

  def percent_correct
    (correct_questions.to_f * 100 / total_test_questions).round(2)
  end

  def current_question_number
   test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def before_validation_set_question
      self.current_question = next_question 
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
