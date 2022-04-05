class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @test_passages = @user.test_passages
  end

  def call
    return unless @test_passage.success?

    Badge.select { |badge| send("#{badge.rule}?", badge) }
  end

  private

  def no_badge?(badge)
    badge.rule == 'success_on_first_try' ? true : !@user.badges.include?(badge)
  end

  def success_on_first_try?(badge)
    return unless no_badge?(badge)

    @test_passages.where(test_id: @test.id).count == 1
  end

  def success_category?(badge)
    if badge.parameter.nil? 
      return
    end

    #category = Category.find_by(id: @test.category_id).title
    category = badge.parameter
    all_tests_category_id = Test.categories(category).ids
    user_all_tests_category_id = @user.tests.categories(category).ids

    all_tests_category_id.sort.uniq == user_all_tests_category_id.sort.uniq
  end

  def success_all_level?(badge)
    #return unless @test_passage.success?
    if badge.parameter.nil? or  not badge.parameter[/\A[+-]?\d+\z/]
      return
    end

    level = badge.parameter
    all_tests_level_id = Test.where(level: level).ids
    user_all_tests_level_id = @user.tests.where(level: level).ids
    
    all_tests_level_id.sort.uniq == user_all_tests_level_id.sort.uniq
  end
end