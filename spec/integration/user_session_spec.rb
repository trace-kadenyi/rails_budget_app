require 'rails_helper'

RSpec.describe 'User Session', type: :feature do
  describe 'GET /users/sign_in' do
    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content 'LOG IN'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content 'Email'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content 'Password'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content 'Remember me'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_button('Log in')
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content 'Sign up'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content 'Forgot your password?'
    end

    it 'displays the contents of the page' do
      visit new_user_session_path
      expect(page).to have_content "Didn't receive confirmation instructions?"
    end
  end

  describe 'POST /users/sign_in' do
    before(:each) do
      visit new_user_session_path
      within 'form' do
        fill_in 'Email', with: 'mamoa@gmail.com'
        fill_in 'Password', with: 'qwerty'
      end

      # log in to the app
      click_button 'Log in'

      # redirect to the categories page
      expect(page).to have_current_path(categories_path)

      # display the contents of the page
      expect(page).to have_content 'Categories'
      expect(page).to have_link 'SmartMoney'
      expect(page).to have_link 'CATEGORIES'
      expect(page).to have_link 'NEW EXPENDITURE'
      expect(page).to have_link 'Logout'
      expect(page).to have_button('Add New Category')

      # click on the add new category button
      click_button 'Add New Category'

      # redirect to the new category page
      expect(page).to have_current_path(new_category_path)

      # display the contents of the page
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Icon'
      expect(page).to have_content 'Description'
      expect(page).to have_button('Create Category')

      # fill in the form
      within 'form' do
        fill_in 'Name', with: 'Vacation'
        fill_in 'Icon', with: 'https://img.freepik.com/premium-vector/summer-vacation-icon-set_24640-44983.jpg?w=2000'
        fill_in 'Description', with: 'Vacation expenses either solo or with the family.'
      end

      # click on the create category button
      click_button 'Create Category'

      # redirect to the categories page
      expect(page).to have_current_path(categories_path)

      # display the contents of the page

      expect(page).to have_link 'Vacation'
      expect(page).to have_button('Add New Category')
      expect(page).to have_button('EDIT')
      expect(page).to have_button('REMOVE')

      # click on the edit button
      click_button 'EDIT'

      # redirect to the edit category page
      expect(page).to have_current_path(edit_category_path(1))

      # display the contents of the page
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Icon'
      expect(page).to have_content 'Description'
      expect(page).to have_button('Update Category')

      # fill in the form
      within 'form' do
        fill_in 'Name', with: 'Holiday'
        fill_in 'Icon', with: 'https://img.freepik.com/premium-vector/summer-vacation-icon-set_24640-44983.jpg?w=2000'
        fill_in 'Description', with: 'Vacation expenses either solo or with the family.'
      end

      # click on the update category button
      click_button 'Update Category'

      # redirect to the categories page
      expect(page).to have_current_path(categories_path)

      #  click category link
      click_link 'Holiday'

      # redirect to the category page
      expect(page).to have_current_path(category_path(1))

      # display the contents of the page
      expect(page).to have_content 'Holiday'
      expect(page).to have_content 'https://img.freepik.com/premium-vector/summer-vacation-icon-set_24640-44983.jpg?w=2000'
      expect(page).to have_content 'Vacation expenses either solo or with the family.'
      expect(page).to have_link 'Back to Categories'
      expect(page).to have_content 'Total Amount: $0.0'
      expect(page).to have_link 'Add New Transaction'
      expect(page).to have_content 'There are currently no transactions.'

      # click on the add new transaction button
      click_link 'Add New Transaction'

      # redirect to the new transaction page
      expect(page).to have_current_path(new_category_transaction_path(1))

      # display the contents of the page

      expect(page).to have_content 'Add New Expenditure'
      expect(page).to have_content 'Name'
      expect(page).to have_content 'Amount'
      expect(page).to have_content 'Category'
      expect(page).to have_button('Create Expenditure')

      # fill in the form
      within 'form' do
        fill_in 'Name', with: 'Airfare'
        fill_in 'Amount', with: '200'
        select 'Holiday', from: 'Category'
      end

      # click on the create expenditure button
      click_button 'Create Expenditure'

      # redirect to the category page
      expect(page).to have_current_path(category_path(1))

      # display the contents of the page
      expect(page).to have_content 'Airfare'
      expect(page).to have_content '200'
      expect(page).to have_content '16/11/2022'
      expect(page).to have_button('View')
      expect(page).to have_button('Delete')

      # click on the view button
      click_button 'View'

      # redirect to the transaction page
      expect(page).to have_current_path(category_transaction_path(1, 1))

      # display the contents of the page
      expect(page).to have_content 'Airfare'
      expect(page).to have_content 'Amount: $200.0'
      expect(page).to have_content 'Date of transaction: 2022-11-16 13:25:05 UTC'
      expect(page).to have_link 'Back to Expenditures'

      # click on the back to expenditures button
      click_link 'Back to Expenditures'

      # redirect to the category page
      expect(page).to have_current_path(category_path(1))
    end
  end
end
