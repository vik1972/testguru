class TestsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  before_action :find_test, only: %i[show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
    #@test = Test.find(params[:id])
    @questions = Test.find(params[:id]).questions
  end

  def edit
    #@test = Test.find(params[:id])
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def new 
    @test = Test.new
  end

  def update
    #@test = Test.find(params[:id])

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to tests_path
  end
  
  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render plain: "Тест не найден"
  end
end
