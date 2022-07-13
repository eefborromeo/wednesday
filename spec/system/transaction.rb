require 'rails_helper'

RSpec.describe "Transaction", type: :system do
    let(:trader) { create(:full_access_user) }
    let(:admin) { create(:admin_user) }

    context "Trader" do
        before do
            login trader
        end
        
        it "will view transactions after buying and selling" do
            buy_asset
            expect(page).to have_content("Transactions")
            page.find('table')
            page.find('a', text: 'Type')
            page.find('.text-green-600', text: 'buy')
            sell_asset
            page.find('table')
            page.find('a', text: 'Type')
            page.find('.text-red-600', text: 'sell')
        end
    end
    
    context "Admin" do
        before do
            login admin
        end
        
        it "will be viewing all transactions" do
            click_on "All Transactions"
            page.find('table')
            page.find('a', text: 'User Email')
            page.all('a', text: `'#{trader.email}'`)
            page.find('a', text: 'Type')
            page.find('.text-green-600', text: 'buy')
            page.find('.text-red-600', text: 'sell')
        end
    end

    private

    def login(user)
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
        expect(page).to have_content('Signed in successfully.')
    end

    def buy_asset
        click_on "+ Add Asset"
        fill_in "asset[asset_name]", with: "JBFCF"
        click_on "Add"
        click_on "Portfolio"
        click_on "JBFCF"
        click_on "Buy Shares"
        sleep(5)
        fill_in "Shares", with: "5"
        click_on "Buy Shares"
    end

    def sell_asset
        click_on "Portfolio"
        click_on "Sell Shares"
        sleep(5)
        fill_in "Shares", with: "5"
        click_on "Sell Shares"
    end
end