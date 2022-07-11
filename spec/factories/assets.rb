FactoryBot.define do
  factory :asset do
    asset_name { "MSFT" }
    association :user

    trait :invalid_attr do
      asset_name { "wrongassetsymbol" }
    end
  end
end
