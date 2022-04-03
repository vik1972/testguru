class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @test_passages = @user.test_passages
  end

  def call
    Badge.select { |badge| send("#{badge.rule}?", badge) }
  end

  private

  def no_badge?(badge)
    badge.rule == 'success_on_first_try' ? true : !@user.badges.include?(badge)
  end

  def success_on_first_try?(badge)
    return unless @test_passage.success? && no_badge?(badge)

    @user.tests.where(id: @test.id).count == 1
  end

  def success_category?(badge)
    return unless @test_passage.success?

    category = Category.find_by(id: @test.category_id).title
    all_tests_category_id = Test.categories(category).ids
    user_all_tests_category_id = Array(@user.tests.ids)

    all_tests_category_id.sort.uniq == user_all_tests_category_id.sort.uniq
  end

  def success_all_level?(badge)
    return unless @test_passage.success?

    level = @test.test_level(@test)
    all_tests_level_id = Array(Test.send("#{level}").ids)
    user_all_tests_level_id = Array(@user.tests.send("#{level}").ids)
    
    all_tests_level_id.sort.uniq == user_all_tests_level_id.sort.uniq
  end
end