class WednesdayController < ApplicationController
    def index
        @user = current_user
        @assets = Asset.get_popular_assets
    end
end