FactoryBot.define do
  factory :transaction do
    sequence(:user_email) { |n| "wedtrader#{n}@wednestrade.com" }
    company_name { "Microsoft Corporation" }
    asset_name { "MSFT" }
    asset_price { rand(1.00...10000.00) }
    shares { rand(1.00...100.00) }
    transaction_total { asset_price * shares }
    association :user

    trait :buy do
      transaction_type { "buy" }
    end

    trait :sell do
      transaction_type { "sell" }
    end

    trait :invalid_attr do
      asset_name { "wrongassetsymbol" }
    end

    factory :buy_transac, traits: [:buy]
    factory :sell_transac, traits: [:sell]

  end
end
