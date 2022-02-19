class SessionsController < Devise::SessionsController

  def create
    super
    flash[:notice] = "Привет, #{current_user.name}" if current_user
  end
end