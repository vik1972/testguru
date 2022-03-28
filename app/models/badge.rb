class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destory
  has_many :user, through: :user_badges
end
