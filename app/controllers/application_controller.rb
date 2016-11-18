class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :ensure_signup_complete, only: [:new, :create, :update, :destroy]


  def after_sign_in_path_for(resource)
    #current_user_path
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password)
    }
  end

  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
end
