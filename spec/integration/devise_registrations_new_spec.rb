require 'rails_helper'

RSpec.describe 'Registrations New', type: :feature do
  describe 'GET /users/sign_up' do
    it 'displays the contents of the page' do
      visit new_user_registration_path
      expect(page).to have_content 'Sign Up'
    end

    it 'displays the contents of the page' do
      visit new_user_registration_path
      expect(page).to have_content 'Name'
    end

    it 'displays the contents of the page' do
      visit new_user_registration_path
      expect(page).to have_content 'Email'
    end

    it 'displays the contents of the page' do
      visit new_user_registration_path
      expect(page).to have_content 'Password'
    end

    it 'displays the contents of the page' do
      visit new_user_registration_path
      expect(page).to have_content 'Password confirmation'
    end

    it 'displays the contents of the page' do
      visit new_user_registration_path
      expect(page).to have_button('Create User')
    end

    it 'displays the contents of the page' do
      visit new_user_registration_path
      expect(page).to have_content 'Log in'
    end

    it 'displays the contents of the page' do
      visit new_user_registration_path
      expect(page).to have_content "Didn't receive confirmation instructions?"
    end
  end

  describe 'Sign up a new user' do
    before(:each) do
      visit new_user_registration_path
      within 'form' do
        fill_in 'Name', with: 'mamoa'
        fill_in 'Email', with: 'mamoa@gmail.com'
        fill_in 'Password', with: 'qwerty'
        fill_in 'Password confirmation', with: 'qwerty'
      end
      click_button 'Create User'
      expect(page).to have_content 'Welcome jason@gmail.com!'
      expect(page).to have_content 'You can confirm your account email through the link below:'
      expect(page).to have_content 'Confirm my account'

      # click_link 'Confirm my account'
      click_link 'Confirm my account'
      expect(page).to have_content 'Your email address has been successfully confirmed.'
    end
  end
end
