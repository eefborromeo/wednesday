FactoryBot.define do
  factory :asset do
    association :user
    asset_name { "MSFT" }

    trait :invalid_asset_name do
      asset_name { "deliberatelywrongassetsymbol" }
    end

    trait :numerical_asset_name do
      asset_name { 1 }
    end

    factory :invalid_asset, traits: [:invalid_asset_name]
    factory :numerical_asset, traits: [:numerical_asset_name]
  end
end
