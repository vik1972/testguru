class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  scope :assigned_badges, -> (user, badge) { where(user: user, badge: badge) }
  
end
