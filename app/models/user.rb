class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  def test_by_level(level)
    Test.joins(:passed_tests)
        .where('passed_tests.user_id = ? AND tests.level = ?', id, level)
  end
end
