class AssetController < ApplicationController
    before_action :set_asset, only: [:show]

    def show
        @asset_price = Asset.get_latest_price(@asset.name)
    end

    def new
        @asset = Asset.new
    end

    def create
        @asset = Asset.new(asset_params)

        if @asset.save
            redirect_to asset_path(@asset.name)
        else
            render :new
        end
    end

    private

    def set_asset
        @asset = Asset.find_by!(name: params[:id])
    end

    def asset_params
        params.require(:asset).permit(:name)
    end
end
