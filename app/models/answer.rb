class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }
  validate :validate_max_answer

  private

  def validate_max_answer
    errors.add(:question) if question.answers.size > 4
  end

end
