class TransactionController < ApplicationController
    before_action :set_asset, only: [:new, :create]

    def index 
        approved(root_path)
        @q = current_user.transactions.ransack(params[:q])
        @transactions = @q.result.order(created_at: :desc)
    end

    def new
        approved(asset_index_path)
        @asset_info = Asset.get_asset_info(@asset.asset_name)
        @transaction = Transaction.new
    end
    
    def create
        @transaction = Transaction.new(transaction_params)
        
        if @transaction.save
            redirect_to transaction_index_path, notice: "You have successfully bought #{@transaction.shares} shares of #{@transaction.asset_name}."
        else
            redirect_to asset_index_path, alert: "#{@transaction.errors[:base][0]}"
        end
    end

    private

    def set_asset
        @asset = Asset.find_by(asset_name: params[:id], user_id: current_user.id)
    end

    def transaction_params
        params[:transaction][:user_id] = current_user.id
        params[:transaction][:user_email] = current_user.email
        params[:transaction][:transaction_total] = params[:transaction][:asset_price].to_d * params[:transaction][:shares].to_d
        params[:transaction][:transaction_type] = 'buy'
        
        params.require(:transaction).permit(:user_id, :company_name, :asset_name, :asset_price, :transaction_type, :user_email, :shares, :transaction_total)
    end

    def approved(page)
        if !current_user.approved
            flash[:notice] = "Your account must be approved to access this area."
            redirect_to page unless current_user.approved?
        end
    end
end
