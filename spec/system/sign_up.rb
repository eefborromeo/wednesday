require 'rails_helper'

RSpec.describe "Sign up", type: :system do
    let(:username) { Faker::Internet.username(specifier: 1...14) }
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password(min_length: 6) }

    scenario "with valid details" do
        visit root_path
        click_on "Sign up"
        sleep(3)
        expect(current_path).to eq(new_user_registration_path)
        expect(page).to have_content("Sign up")
        fill_in "Username", with: username
        fill_in "First name", with: first_name
        fill_in "Last name", with: last_name
        fill_in "Email", with: email
        fill_in "Password", with: password
        fill_in "Password confirmation", with: password
        click_button "Sign up"
        expect(current_path).to eq(new_user_session_path)
    end

    context "with invalid details" do
        before do
            visit new_user_registration_path
        end
        
        scenario "blank fields" do
            fill_in "Username", with: ""
            fill_in "First name", with: ""
            fill_in "Last name", with: ""
            fill_in "Email", with: ""
            fill_in "Password", with: ""
            fill_in "Password confirmation", with: ""
            click_button "Sign up"
            message = page.find("#user_username").native.attribute("validationMessage")
            expect(message).to eq "Please fill out this field."
        end

        scenario "incorrect password confirmation" do
            fill_in "Username", with: username
            fill_in "First name", with: first_name
            fill_in "Last name", with: last_name
            fill_in "Email", with: email
            fill_in "Password", with: "123456"
            fill_in "Password confirmation", with: "123654"
            click_button "Sign up"
            expect(page).to have_content("Password confirmation doesn't match Password")
        end

        scenario "invalid email" do
            fill_in "Username", with: username
            fill_in "First name", with: first_name
            fill_in "Last name", with: last_name
            fill_in "Email", with: "email"
            fill_in "Password", with: password
            fill_in "Password confirmation", with: password
            click_button "Sign up"
            message = page.find("#user_email").native.attribute("validationMessage")
            expect(message).to eq "Please include an '@' in the email address. 'email' is missing an '@'."
        end

        scenario "too short password" do
            fill_in "Username", with: username
            fill_in "First name", with: first_name
            fill_in "Last name", with: last_name
            fill_in "Email", with: email
            fill_in "Password", with: "123"
            fill_in "Password confirmation", with: "123"
            click_button "Sign up"
            expect(page).to have_content("Password is too short (minimum is 6 characters)")
        end
    end
end