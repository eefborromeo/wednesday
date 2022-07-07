FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "wedtrader#{n}@wednestrade.com" }
      email { "wedtrader@wednestrade.com" }
      password { "wedtrade" }
      confirmed_at { nil }

      trait :admin do
        admin { true }
      end

      trait :confirmed do
        confirmed_at { 1.day.ago }
      end

      trait :approved do
        approved { true }
      end

      factory :admin_user, traits: [:admin, :confirmed, :approved]
      factory :confirmed_user, traits: [:confirmed]
      factory :full_access_user, traits: [:confirmed, :approved]
    end
  end