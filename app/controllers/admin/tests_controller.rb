class Admin::TestsController < Admin::BaseController
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  
  before_action :set_tests, omly: %i[index update_inline]
  before_action :find_test, only: %i[show edit update destroy update_inline]

  def index

  end

  def show
    @questions = Test.find(params[:id]).questions
  end

  def edit; end

  def create
    @test = current_user.author_tests.new(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('.succes')
    else
      render :new
    end
  end

  def new 
    @test = Test.new
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test]
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    if @test.destroy
      flash[:notice] = t('.success')
    else
      flash[:alert] = t('.delete')
    end
    redirect_to admin_tests_path
  end
  
  private

  def set_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :ready)
  end

  def rescue_with_test_not_found
    render plain: "Тест не найден"
  end
end
