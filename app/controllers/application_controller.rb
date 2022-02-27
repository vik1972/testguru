class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_local

  def default_url_options
    { lang: (I18n.locale if I18n.locale != I18n.default_locale)  }
  end

  private

  #def after_sign_in_path_for(user)
    #current_user.admin? ? admin_tests_path : root_path
    #root_path
  #end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, 
                                      keys: [:email,
                                             :name,
                                             :surname,
                                             :password,
                                             :password_confirmation])
  end

  def set_local
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end

