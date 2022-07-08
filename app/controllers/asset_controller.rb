class AssetController < ApplicationController
    before_action :set_asset, only: [:show, :destroy]

    def index
        @assets = current_user.assets
    end
    
    def show
        @asset_info = Asset.get_asset_info(@asset.asset_name)
        @q = Transaction.where(asset_name: @asset.asset_name).ransack(params[:q])
        @transactions = @q.result.order(created_at: :desc)
    end

    def new
        @asset = Asset.new
        @assets = Asset.get_popular_assets
    end

    def create
        @asset = Asset.new(asset_params)

        if @asset.save
            redirect_to asset_index_path
        else
            redirect_to asset_index_path, alert: "#{@asset.errors.first.message}"
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
