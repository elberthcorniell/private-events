require 'rails_helper'

RSpec.feature 'Forms', type: :feature do
  context 'can enter a name and email' do
    scenario 'should be Signed in successfully.' do
      visit new_user_session_path
      within('form') do
        fill_in 'Email', with: 'luffy@onepiece.com'
        # fill_in :name, with: 'zorro'
      end
      click_button 'Log in'
      expect(page).to have_content 'Forgot your password'
    end
  end
end

RSpec.feature 'Forms', type: :feature do
  context 'can enter a name and email' do
    scenario 'should be Registered successfully.' do
      visit new_user_registration_path
      within('form') do
        fill_in 'Email', with: 'zorro@onepiece.com'
        fill_in 'Name', with: 'zorro'
      end
      click_button 'Sign up'
      expect(page).to have_content 'My Events'
    end
  end
end

RSpec.describe 'Forms', type: :system do
  describe 'Registration' do
    it 'shows the name field' do
      visit new_user_registration_path
      expect(page).to have_content('Name')
    end
  end

  it 'shows the Email field' do
    visit new_user_registration_path
    expect(page).to have_content('Email')
  end
end
