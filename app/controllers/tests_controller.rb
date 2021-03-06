class TestsController < ApplicationController
  
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  before_action :authenticate_user!
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.where(ready: true)
  end

  
  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
  
  private

  def find_test
    @test = Test.find(params[:id])
  end

end
