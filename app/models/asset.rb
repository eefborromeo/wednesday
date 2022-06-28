class Asset < ApplicationRecord
    has_many :transactions
    has_many :users, through: :transactions

    def self.iex_api
        IEX::Api::Client.new
    end

    def self.get_latest_price(company)
        Asset.iex_api.quote(company).latest_price
    end
end
