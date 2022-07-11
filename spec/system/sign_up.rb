require 'rails_helper'

RSpec.describe "Sign up", type: :feature do
    let(:username) { Faker::Internet.username }
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password(min_length: 6) }

    before do
        visit root_path
        click_on "Sign up"
    end
end