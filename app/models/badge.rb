class Badge < ApplicationRecord

  RULES = %w[success_category success_on_first_try success_all_level].freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
  validates :title, :img_url, :rule, presence: true
end
