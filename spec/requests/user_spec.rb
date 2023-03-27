require 'rails_helper'

RSpec.describe 'Log in page', type: :system do
  describe 'users/signin' do
    let(:user) { User.create(name: 'user', email: 'user@example.com', password: 'password') }

    before(:each) do
      user.save!
      visit new_user_session_path
    end

    after(:each) do
      sleep(2)
    end

    it 'displays email and password input field and submit button' do
      expect(page).to have_button('Log in')
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
    end

    it 'displays detail error with empty credentials' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'displays error message with invalid credentials' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'wrong_password'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'click on SIGNUP button' do
      link = find('a', text: 'Sign up', match: :first)
      link.click
      sleep(2)
      expect(page).to have_current_path new_user_registration_path
    end

    it 'click on `Forgot your password?`' do
      click_link 'Forgot your password?'
      expect(page).to have_current_path new_user_password_path
    end
  end
end
