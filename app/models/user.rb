class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  validates :name, :surname, :email, presence: true

  def test_by_level(level)
    Test.joins(:passed_tests)
        .where('passed_tests.user_id = ? AND tests.level = ?', id, level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
