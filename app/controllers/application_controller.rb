class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_devise_params, if: :devise_controller?
  #before_action :set_current_user
  skip_before_action :verify_authenticity_token
  after_action :account_thread


  

  def configure_devise_params
  	devise_parameter_sanitizer.permit(:sign_up) do |user|
  		user.permit(:name, :last_name, :role, :email, :password, :password_confirmation)
  	end
  end

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end
  
  def account_thread
    @fecha = Score.find(1)
    @fecha = @fecha.updated_at.strftime("%m")
    if @fecha.to_i + 1 == Date.today.strftime("%m").to_i
      @fecha = Score.find(1)
      @fecha.total = @fecha.total+1
      @fecha.save

      puts "Entro a thread"
      @account = Account.all
      @debt = Debt.find(3)
      @account.each do |ac|
        ac.amount = ac.amount + @debt.amount
        ac.save
      end
    end
    
  end
  
  #def set_current_user
    #User.current_user = current_user
  #end
  

  
  
end
