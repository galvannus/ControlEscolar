class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_devise_params, if: :devise_controller?
  #before_action :set_current_user
  skip_before_action :verify_authenticity_token

  def configure_devise_params
  	devise_parameter_sanitizer.permit(:sign_up) do |user|
  		user.permit(:name, :last_name, :role, :email, :password, :password_confirmation)
  	end
  end

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end
  

  #def set_current_user
    #User.current_user = current_user
  #end
  

  
  
end
