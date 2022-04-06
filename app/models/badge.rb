class Badge < ApplicationRecord

  RULES = [["Пройдены все тесты категории", "success_category"], 
             ["Тест пройден с первой попытки", "success_on_first_try"],
             ["Пройдены все тесты уровня", "success_all_level"],
           ].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
  validates :title, :img_url, :rule, presence: true
end
