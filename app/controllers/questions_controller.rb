class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[destroy]

  def index
    render inline: 'Вопросы теста: <%= @test.questions.inspect %>'
  end

  def show
    render inline: 'Вопрос: <%= Question.find(params[:id]).inspect %>'
  end

  def new
  end
  
  def create
    @question = @test.questions.create!(question_params)
  end

  def destroy
    @question.delete!
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Вопрос не найден"
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
