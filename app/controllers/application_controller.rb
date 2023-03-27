class ApplicationController < ActionController::Base
  # Add custom columns to the Devise sign up form
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    redirect_to = params[:redirect_to]
    
    # If the redirect_to doesn't begin with a /, add it
    if redirect_to && redirect_to[0] != "/"
      redirect_to = "/" + redirect_to
    end
    
    return redirect_to
    
  end
    
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
  end
end
