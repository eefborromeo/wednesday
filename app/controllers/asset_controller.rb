class AssetController < ApplicationController
    before_action :set_asset, only: [:show]

    def index
        @assets = Asset.where(user_id: current_user.id)
    end
    
    def show
        @asset_price = Asset.get_latest_price(@asset.asset_name)
        @asset_company_name = Asset.get_company_name(@asset.asset_name)
    end

    def new
        @asset = Asset.new
    end

    def create
        @asset = Asset.new(asset_params)

        if @asset.save
            redirect_to asset_index_path
        else
            redirect_to root_path, notice: "This asset already exists in your portfolio"
        end
    end

    private

    def set_asset
        @asset = Asset.find_by!(asset_name: params[:id])
    end

    def asset_params
        params.require(:asset).permit(:user_id, :asset_name)
    end
end
