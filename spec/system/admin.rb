require 'rails_helper'

RSpec.describe "Admin functionalities", type: :system do
    let(:admin) { create(:admin_user) }
    let(:trader_confirmed) { build(:confirmed_user) }
    let(:trader) { build(:full_access_user) }
    let(:unapproved) { User.where(approved: "false") }
    
    context "when admin interacts with user" do
        before do
            login admin
        end

        it "will create new trader" do
            click_on "Create Trader"
            fill_in "user_first_name", with: trader.first_name
            fill_in "user_last_name", with: trader.last_name
            fill_in "user_username", with: trader.username
            fill_in "user_email", with: trader.email
            fill_in "user_password", with: trader.password
            click_on "Create User"
            expect(current_path).to eq(admin_users_path) 
            expect(page).to have_content("Dashboard")
            page.find('table')
            page.find('td', text: trader.email)
        end
    
        it "will edit trader details" do
            expect(page).to have_content("Dashboard")
            page.find('table')
            click_on "Show trader"
            click_on "Edit details"
            fill_in "user_username", with: trader.username
            fill_in "user_password", with: trader.password
            fill_in "user_money", with: "5000"
            click_on "Update User"
            expect(page).to have_content("You have successfully updated #{trader.username}'s details")
            expect(page).to have_content('Balance: $5000.0')
        end
        
        it "will view trader details" do
            expect(page).to have_content("Dashboard")
            page.find('table')
            click_on "Show trader"
        end
    end

    context "when views all traders in the app" do
        before do
            user_sign_up
            login admin
            find_link("Show trader", href: admin_user_path(unapproved[0].id)).click
        end

        it "will show pending trader sign up" do
            expect(page).to have_content('Status: Not approved')
        end
        
        it "will approve pending trader" do
            expect(page).to have_content('Status: Not approved')
            find(:css, "#user_approved").set(true)
            expect(page).to have_content('Status: Approved')
        end
    end

    context "when view all transactions" do

    end

    private
    
    def login(user)
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
        expect(current_path).to eq(admin_users_path)
    end

    def user_sign_up
        visit new_user_registration_path
        fill_in "Username", with: trader_confirmed.username
        fill_in "First name", with: trader_confirmed.first_name
        fill_in "Last name", with: trader_confirmed.last_name
        fill_in "Email", with: trader_confirmed.email
        fill_in "Password", with: trader_confirmed.password
        fill_in "Password confirmation", with: trader_confirmed.password
        click_button "Sign up"
    end
end