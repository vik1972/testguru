class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:path_to_last_request) || root_path
    else
      flash.now[:alert] = "Введите email и пароль, пожалуйста"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "Вы вышли из аккаунта!"
  end
end
