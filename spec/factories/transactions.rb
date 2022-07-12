FactoryBot.define do
  factory :transaction do
    user_email { Faker::Internet.unique.email }
    company_name { "Microsoft Corporation" }
    asset_name { "MSFT" }
    asset_price { Faker::Number.between(from: 0.1, to: 1000.0) }
    shares { Faker::Number.between(from: 0.1, to: 10.0) }
    transaction_total { asset_price * shares }
    association :user

    trait :buy do
      transaction_type { "buy" }
    end

    trait :sell do
      transaction_type { "sell" }
    end

    trait :invalid_attr do
      user_email { nil }
      shares { "string" }
      transaction_total { nil }
    end

    factory :buy_transac, traits: [:buy]
    factory :sell_transac, traits: [:sell]
  end
end
