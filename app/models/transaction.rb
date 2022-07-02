class Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :asset

    before_save :update_asset_total_shares

    private 

    def update_asset_total_shares
        @asset = Asset.find_by(id: asset_id, user_id: user_id)
        if transaction_type == "buy"
            @asset.update(total_shares: asset.total_shares + shares)
        else 
            @asset.update(total_shares: asset.total_shares - shares)
        end
    end
end
