class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :update_allowed_parameters, if: :devise_controller?
    before_action :authenticate_user!

    rescue_from IEX::Errors::SymbolNotFoundError, with: :asset_not_found

    protected

    def after_sign_in_path_for(resource_or_scope)
        current_user.admin ? admin_users_path : root_path
    end
    
    def after_sign_out_path_for(resource_or_scope)
        new_user_session_path
    end

    def update_allowed_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :last_name, :first_name, :email, :password, :password_confirmation)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :last_name, :first_name, :email, :password, :current_password)}
    end

    def asset_not_found
        redirect_to new_asset_path, alert: "Invalid asset. Please refer to the Asset Symbol reference link."
    end
end
