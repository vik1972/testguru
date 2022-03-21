class FeedbackMailer < ApplicationMailer

  before_action { @mailer = params[:email] }

  default to: 'testguru2022@gmail.com'

  def send_message(feedback)
    @message = feedback.message
    mail from: @mailer
  end
end