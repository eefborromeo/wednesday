require 'rails_helper'

RSpec.describe "Login followed by logout", type: :feature do
    let(:confirmed_user) { build(:confirmed_user) }
    scenario 'with correct details' do
        visit new_user_session_path
        fill_in "Email", with: confirmed_user.email
        fill_in "Password", with: confirmed_user.password
        click_on "Login"
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Signed in successfully.')
        expect(page).to have_content('Welcome, John Doe!')
        click_on "Sign Out"
        expect(page).to have_content('Signed out successfully.')
    end
end