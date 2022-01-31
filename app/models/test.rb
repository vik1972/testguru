class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(levlel: 5..Float::INFINITY) }
  scope :categories, -> (category) {
      joins(:category)
        .where(categories: {title: category})
  }
  
  def self.sort_categories(category)
    categories(category).order(title: :desc).pluck(:title)
  end

  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :title, presence: true,
                    uniqueness: { scope: :level }

end
