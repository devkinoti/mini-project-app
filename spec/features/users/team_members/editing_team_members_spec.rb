# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can edit team member details' do
  let(:user) do
    FactoryBot.create(:user)
  end

  let(:team_member) do
    FactoryBot.create(:team_member, account: user.account)
  end

  before do
    login_as(user)

    visit edit_team_member_path(team_member)
  end

  scenario 'with valid attributes' do
    fill_in 'First name', with: 'Sample'
    click_button 'Update Team member'

    expect(page).to have_content('Sample')
  end

  scenario 'with invalid attributes' do
    fill_in 'First name', with: ''
    click_button 'Update Team member'

    expect(page).to have_content('Team member has not been updated')
  end
end
