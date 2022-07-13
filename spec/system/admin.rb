require 'rails_helper'

RSpec.describe "Admin functionalities", type: :system do
    let(:admin) { create(:admin_user) }
    let(:trader) { build(:full_access_user) }
    
    context "when admin interacts with user" do
        before do
            login
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
            fill_in "user_money", with: "5000"
            expect(page).to have_content(`'You have successfully updated #{trader.username}'s details'`)
            expect(page).to have_content(`'Balance: 5000.0'`)
        end
        
        it "will view trader details" do
            expect(page).to have_content("Dashboard")
            page.find('table')
            click_on "Show trader"
            expect(page).to have_content(`'Name: #{trader.first_name} #{trader.last_name}'`)
        end
    end

    context "when views all traders in the app" do
        it "will show pending trader sign up" do

        end

        it "will approve pending trader" do

        end
    end

    context "when view all transactions" do

    end

    private
    
    def login
        visit new_user_session_path
        fill_in "Email", with: admin.email
        fill_in "Password", with: admin.password
        click_button "Log in"
        expect(current_path).to eq(admin_users_path)
    end
end