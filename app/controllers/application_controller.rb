class ApplicationController < ActionController::Base
  
  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    # devise_...メソッドで、sign_up時にnameを使う事を許可している
  end
  
end
