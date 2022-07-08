class Transaction < ApplicationRecord
    belongs_to :user

    before_save :check_transaction_amount_validity
    after_save :update_asset_total_shares
    after_save :update_user_balance

    validates :shares,
                format: { with: /\A-?+(?=.??\d)\d*\.?\d*\z/, message: 'Only allows numbers' }

    private 

    def check_transaction_amount_validity
        user = User.find_by(id: user_id)
        asset = Asset.find_by(asset_name: asset_name, user_id: user_id)
        
        if transaction_type == "buy" && user.money < (shares * asset_price)
            errors.add(:base, 'Insufficient balance, please try again later.')
            throw :abort
        end

        if transaction_type == "sell" && shares > asset.total_shares
            errors.add(:base, 'Insufficient number of shares, please try again later.')
            throw :abort
        end
    end

    def update_asset_total_shares
        @asset = Asset.find_by(asset_name: asset_name, user_id: user_id)
        if transaction_type == "buy"
            @asset.update(total_shares: @asset.total_shares + shares)
        else 
            @asset.update(total_shares: @asset.total_shares - shares)
        end
    end

    def update_user_balance
        user = User.find_by(id: user_id)
        if transaction_type == "buy"
            user.update(money: user.money - (shares * asset_price))
        else 
            user.update(money: user.money + (shares * asset_price))
        end
    end
end
