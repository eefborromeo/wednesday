require 'rails_helper'

RSpec.describe "Login followed by logout", type: :system do
    let(:confirmed_user) { build(:confirmed_user) }
    
    scenario 'with correct details' do
        visit new_user_session_path
        fill_in "Email", with: confirmed_user.email
        fill_in "Password", with: confirmed_user.password
        click_button "Log in"
        sleep(4)
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Signed in successfully.')
        expect(page).to have_content('Welcome, John Doe!')
        click_on "Sign Out"
        sleep(4)
        expect(page).to have_content('Signed out successfully.')
    end
    
    scenario 'with incorrect details' do
        visit new_user_session_path
        fill_in "Email", with: confirmed_user.email
        fill_in "Password", with: '123456'
        click_button "Log in"
        expect(page).to have_content('Invalid Email or password.')
    end
end