class TransactionController < ApplicationController
    before_action :approved

    def new
        @asset = Asset.find_by(asset_name: params[:id])
        @lastest_price = Asset.get_latest_price(@asset.asset_name)
        @transaction = Transaction.new
    end

    def create
        @transaction = Transaction.new(transaction_params)
        
        if @transaction.save
            redirect_to transaction_index_path
        else
            render :new
        end
    end

    private

    def transaction_params
        params.require(:transaction).permit(:shares)
    end

    def approved
        if !current_user.approved
            flash[:notice] = "Your account must be approved to access this area."
            redirect_to root_path unless current_user.approved?
        end
    end
end
