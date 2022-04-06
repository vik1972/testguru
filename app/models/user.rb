class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable,
         :validatable,
         :confirmable

  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id
  has_many :gists, foreign_key: :author_id, class_name: 'Gist'

  validates :email, presence: true #:name, :surname,
  validates :email, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP,
                       message: "Формат почты: name@example.com" }

  def test_by_level(level)
    Test.joins(:passed_tests)
        .where('passed_tests.user_id = ? AND tests.level = ?', id, level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end
end
