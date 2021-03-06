require 'rails_helper'

RSpec.describe "viewing, buying, and selling stocks", type: :system do
    let(:confirmed_and_approved_user) { create(:full_access_user) }
    let(:confirmed_user) { create(:confirmed_user) }
    
    context "confirmed and approved user" do
        before do
            login confirmed_and_approved_user
            click_on "+ Add Asset"
            fill_in "asset[asset_name]", with: "JBFCF"
            click_on "Add"
        end

        it "will show stock information when viewing stocks" do
            expect(page).to have_content("You have successfully added JBFCF to your portfolio")
            expect(page).to have_content("JBFCF")
            click_on "JBFCF"
            expect(page).to have_content("Jollibee Foods Corp.")
            expect(page).to have_content("JBFCF high market price for the last month")
            expect(page).to have_content("Latest Headlines")
        end

        it "will be buying and selling stocks" do
            click_on "Buy Shares"
            fill_in "Shares", with: "5"
            click_on "Buy Shares"
            expect(page).to have_content("You have successfully bought 5.0 shares of JBFCF.")
            expect(page).to have_content("Transactions")
            expect(page).to have_content("All transactions list")
            sleep(3)
            click_on "Portfolio"
            click_on "Sell Shares"
            fill_in "Shares", with: "3"
            click_on "Sell Shares"
            expect(page).to have_content("You have successfully sold 3.0 shares of JBFCF.")
        end
    end

    context "confirmed user" do
        before do
            login confirmed_user
            click_on "+ Add Asset"
            fill_in "asset[asset_name]", with: "JBFCF"
            click_on "Add"
        end

        it "will show stock information when viewing stocks" do
            expect(page).to have_content("You have successfully added JBFCF to your portfolio")
            expect(page).to have_content("JBFCF")
            click_on "JBFCF"
            expect(page).to have_content("Jollibee Foods Corp.")
            expect(page).to have_content("JBFCF high market price for the last month")
            expect(page).to have_content("Latest Headlines")
        end
        
        it "will not be buying and selling stock when unapproved" do
            click_on "Buy Shares"
            expect(page).to have_content("Your account must be approved to access this area.")
            expect(page).not_to have_content("Sell Shares")
        end
    end

    private

    def login(user)
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Signed in successfully.')
    end
end
