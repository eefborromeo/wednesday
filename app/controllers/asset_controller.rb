class AssetController < ApplicationController
    before_action :set_asset, only: [:show, :destroy]

    def index
        @q = current_user.assets.ransack(params[:q])
        @assets = @q.result.order(updated_at: :desc)
    end
    
    def show
        @asset_info = Asset.get_asset_info(@asset.asset_name)
        @asset_history = Asset.get_historical_prices(@asset.asset_name)
        @q = current_user.transactions.where(asset_name: @asset.asset_name).ransack(params[:q])
        @transactions = @q.result.order(created_at: :desc)
        @asset_transactions = current_user.transactions.where(asset_name: @asset.asset_name)
    end

    def new
        @asset = Asset.new
        @assets = Asset.get_popular_assets
    end

    def create
        @asset = Asset.new(asset_params)

        if @asset.save
            redirect_to asset_index_path, notice: "You have successfully added #{@asset.asset_name} to your portfolio"
        else
            redirect_to new_asset_path, alert: "#{@asset.errors.first.message}"
        end
    end

    def destroy
        redirect_to asset_index_path, notice: "You have successfully removed #{@asset.asset_name} from your portfolio."
        @asset.destroy
    end

    private

    def set_asset
        @asset = Asset.find_by!(asset_name: params[:id], user_id: current_user.id)
    end

    def asset_params
        params.require(:asset).permit(:user_id, :asset_name)
    end
end
