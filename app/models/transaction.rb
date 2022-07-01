class Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :asset

    before_save :update_asset_total_shares

    private 

    def update_asset_total_shares
        asset = Asset.find_by(id: asset_id)
        asset.update(total_shares: shares)
    end
end
