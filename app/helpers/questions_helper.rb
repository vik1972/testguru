module QuestionsHelper
  def question_header(question)
    if question.persisted?
      t('admin.questions.show.edit_question')  #{question.body} 
    else
      t('admin.questions.show.new_question')
    end
  end
end
