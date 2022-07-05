class SellController < ApplicationController
    before_action :approved
    
    def new
        @asset = Asset.find_by(asset_name: params[:id], user_id: current_user.id)
        @user = current_user.id
        @company_name = Asset.get_company_name(@asset.asset_name)
        @latest_price = Asset.get_latest_price(@asset.asset_name)
        @transaction = Transaction.new
    end

    def create
        @transaction = Transaction.new(sell_params)

        if @transaction.save
            redirect_to transaction_index_path
        else
            redirect_to asset_index_path, alert: "#{@transaction.errors[:base][0]}"
        end
    end

    private

    def sell_params
        params[:transaction][:user_id] = current_user.id
        params[:transaction][:user_email] = current_user.email
        params[:transaction][:transaction_type] = 'sell'
        
        params.require(:transaction).permit(:user_id, :asset_id, :company_name, :asset_name, :asset_price, :transaction_type, :user_email, :shares)
    end

    def approved
        if !current_user.approved
            flash[:notice] = "Your account must be approved to access this area."
            redirect_to root_path unless current_user.approved?
        end
    end
end
