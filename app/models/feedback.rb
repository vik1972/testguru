class Feedback

  include ActiveModel::Model 
  attr_accessor :email, :message

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :message, presence: true

end