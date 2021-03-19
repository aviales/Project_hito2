class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profile_picture])
    end
end

def authenticate_alive_user!
    authenticate_user!
    redirect_to root_url unless current_user.is_alive?
end

def authenticate_admin_user!
    authenticate_user!
    redirect_to root_url unless current_user.is_admin?
end