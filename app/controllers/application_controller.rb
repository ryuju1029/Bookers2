class ApplicationController < ActionController::Base
    before_action :authenticate_user!,except: [:top, :about]
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    Refile.secret_key = 'abe7361f6433bc71d5ad7269528064e5b3752692ba6b2a120fa4e3bfc038ffc64e27a0a737f32dcafea177b71058eca405c7c06b4917768471ae836c8d42db6a'
    
  protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    added_attrs = [:user_name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(resource)
      user_path(current_user.id)
  end

  
end
