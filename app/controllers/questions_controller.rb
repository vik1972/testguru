class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  
  before_action :authenticate_user!
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy edit update]

  def show; end

  def new
    @question = Question.new
  end
  
  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question.test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
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
