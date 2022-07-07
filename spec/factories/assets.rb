FactoryBot.define do
  factory :asset do
    asset_name { "MSFT" }
    total_shares { rand(1.00...100.00) }
    association :user

    trait :invalid_attr do
      asset_name { nil }
    end
  end
end
