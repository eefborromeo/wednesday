class AssetController < ApplicationController
    before_action :set_asset, only: [:show, :destroy]

    def index
        @assets = current_user.assets
    end
    
    def show
        @asset_price = Asset.get_latest_price(@asset.asset_name)
        @asset_company_name = Asset.get_company_name(@asset.asset_name)
    end

    def new
        @asset = Asset.new
        @user = current_user
    end

    def create
        @asset = Asset.new(asset_params)

        if @asset.save
            redirect_to asset_index_path
        else
            redirect_to asset_index_path, notice: "This asset already exists in your portfolio"
        end
    end

    def destroy
        @asset.destroy
        redirect_to asset_index_path
    end

    private

    def set_asset
        @asset = Asset.find_by!(asset_name: params[:id], user_id: current_user.id)
    end

    def asset_params
        params.require(:asset).permit(:user_id, :asset_name)
    end
end
