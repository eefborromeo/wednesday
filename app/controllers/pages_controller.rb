class PagesController < ApplicationController
    before_action :check_admin, only: [:admin]

    def index
        @user = current_user
        @microsoft = Asset.get_latest_price('MSFT')
        @facebook = Asset.get_latest_price('META')
        @amazon = Asset.get_latest_price('AMZN')
        @apple = Asset.get_latest_price('AAPL')
        @netflix = Asset.get_latest_price('NFLX')
        @alphabet = Asset.get_latest_price('GOOG')
        @jollibee = Asset.get_latest_price('JBFCF')
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