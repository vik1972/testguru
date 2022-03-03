class Gist < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :question
end
