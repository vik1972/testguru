class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @test_passages = @user.test_passages
  end

  def call
    return unless @test_passage.success?
    Badge.all.each do |badge|
      @user.badges << badge if send("#{badge.rule}?", badge.parameter) and !@user.badges.include?(badge)
    end
  end

  private

  def success_on_first_try?(badge)
    @test_passages.where(test_id: @test.id).count == 1
  end

  def success_category?(parameter)
    if parameter.nil? 
      return
    end

    all_tests_category_id = Test.categories(parameter).ids
    user_all_tests_category_id = @user.tests.categories(parameter).ids

    all_tests_category_id.sort.uniq == user_all_tests_category_id.sort.uniq
  end

  def success_all_level?(parameter)
    if parameter.nil? or !parameter[/\A[+-]?\d+\z/]
      return
    end

    all_tests_level_id = Test.where(level: parameter).ids
    user_all_tests_level_id = @user.tests.where(level: parameter).ids
    
    all_tests_level_id.sort.uniq == user_all_tests_level_id.sort.uniq
  end
end