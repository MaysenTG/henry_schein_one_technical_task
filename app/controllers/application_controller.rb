class ApplicationController < ActionController::Base
  # Add custom columns to the Devise sign up form
  before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    end
end
