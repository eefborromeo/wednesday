require 'rails_helper'

RSpec.describe "Login followed by logout", type: :system do
    let(:user) { create(:confirmed_user) }
    
    scenario 'with correct details' do
        visit new_user_session_path
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
        sleep(4)
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Signed in successfully.')
        expect(page).to have_content(`'Welcome, #{user.first_name} #{user.last_name}!'`)
        click_on "Sign Out"
        expect(page).to have_content('Signed out successfully.')
    end
    
    scenario 'with incorrect details' do
        visit new_user_session_path
        fill_in "Email", with: "email@email.com"
        fill_in "Password", with: '123456'
        click_button "Log in"
        expect(page).to have_content('Invalid Email or password.')
    end
end