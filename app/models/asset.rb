class Asset < ApplicationRecord
    belongs_to :user

    before_save :upcase_asset_name, :check_asset_name_validity

    validates :asset_name, 
                uniqueness: { 
                    scope: :user_id,
                    case_sensitive: false,
                    message: 'This asset already exists in your portfolio.'
                },
                format: { with: /\A[a-zA-Z]+\z/, message: 'Only allows letters' }
   
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

    private

    def self.iex_api
        IEX::Api::Client.new
    end

    def upcase_asset_name
        self.asset_name = self.asset_name.upcase
    end

    def check_asset_name_validity
        unless Asset.iex_api.company(self.asset_name).company_name?
            throw :abort
        end
    end
end
