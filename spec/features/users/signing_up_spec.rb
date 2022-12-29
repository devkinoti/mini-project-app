# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can sign up' do
  scenario 'when user provides valid details' do
    visit '/'

    click_link 'Create an account'

    # byebug

    fill_in 'First Name', with: 'test'
    fill_in 'Last Name', with: 'sample'
    fill_in 'Email address', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirm password', with: 'password'
    find('#basic-register-checkbox').click
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
