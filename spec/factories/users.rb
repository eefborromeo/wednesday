FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 10, mix_case: true, special_characters: true) }
    username { Faker::Internet.unique.username(specifier: 1...15) }
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
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