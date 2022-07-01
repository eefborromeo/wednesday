class SellController < ApplicationController
    def new
        @asset = Asset.find_by(asset_name: params[:id], user_id: current_user.id)
        @user = current_user.id
        @company_name = Asset.get_company_name(@asset.asset_name)
    end
end
