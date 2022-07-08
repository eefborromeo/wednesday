class Asset < ApplicationRecord
    belongs_to :user
    
    validates :asset_name, :uniqueness => {:scope => :user_id}

    def self.get_asset_info(asset_name)
        { 
            company_name: Asset.iex_api.company(asset_name).company_name, 
            price: Asset.iex_api.quote(asset_name).latest_price 
        }
    end

    def self.get_popular_assets
        popular_assets = []
        sample = [
            'MSFT',
            'META',
            'AMZN',
            'AAPL',
            'NFLX',
            'GOOG',
            'JBFCF'
        ]
        sample.each do |each|
            popular_assets << {
                name: each,
                company_name: Asset.iex_api.company(each).company_name,
                price: Asset.iex_api.quote(each).latest_price
            }
        end
        popular_assets
    end

    def self.iex_api
        IEX::Api::Client.new
    end
end
