require 'rails_helper'

RSpec.describe 'Splash Index', type: :feature do
  describe 'GET /' do
    it 'displays the contents of the page' do
      visit root_path
      expect(page).to have_content 'SmartMoney'
    end

    it 'displays the contents of the page' do
      visit root_path
      expect(page).to have_content 'SIGN UP'
    end

    it 'redirects to the SIGN UP page' do
      visit root_path
      click_link 'SIGN UP'
      expect(page).to have_current_path(new_user_registration_path)
    end

    it 'displays the contents of the page' do
      visit root_path
      expect(page).to have_content 'LOG IN'
    end

    it 'redirects to the LOG IN page' do
      visit root_path
      click_link 'LOG IN'
      expect(page).to have_current_path(new_user_session_path)
    end
  end
end
