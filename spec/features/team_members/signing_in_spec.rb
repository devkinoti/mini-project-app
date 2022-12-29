# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Team members can sign in' do
  let(:user) do
    FactoryBot.create(:user)
  end

  let(:team_member) do
    FactoryBot.create(:team_member, account: user.account)
  end

  scenario 'with valid credentials' do
    visit '/'

    click_link 'Sign in as team member'
    # byebug
    fill_in 'Email address', with: team_member.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_content "Hello, #{team_member.first_name}"
  end
end
