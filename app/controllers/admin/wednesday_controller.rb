class Admin::WednesdayController < ApplicationController
  before_action :check_admin

    def index
        @users = User.where(admin: false)
    end
    
    private

    def check_admin
        return if current_user.admin?
        redirect_to root_path, notice: 'Access Denied'
    end
end
