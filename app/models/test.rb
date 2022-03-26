class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_passages

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
