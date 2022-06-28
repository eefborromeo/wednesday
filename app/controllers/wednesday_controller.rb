class WednesdayController < ApplicationController
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
end