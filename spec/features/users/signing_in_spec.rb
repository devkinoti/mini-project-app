# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can sign in' do
  let(:user) do
    FactoryBot.create(:user)
  end

  scenario 'with valid credentials' do
    visit '/'

    click_link 'Sign in as account owner'
    # byebug
    fill_in 'Email address', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_content "Hello, #{user.first_name}"
  end
end
