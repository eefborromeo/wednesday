class PagesController < ApplicationController
    before_action :check_admin, only: [:admin]

    def index
        @user = current_user
    end

    def admin
        @users = User.all.where(admin: false)
    end
    
    private

    def check_admin
        return if current_user.admin?
        redirect_to root_path, notice: 'Access Denied'
    end

end