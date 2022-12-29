# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can create new team members' do
  let(:user) do
    FactoryBot.create(:user)
  end

  before do
    login_as(user)

    visit team_members_path
  end

  scenario 'with valid team member attributes' do
    click_link 'New'

    fill_in 'First name', with: 'Jane'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'jane@gmail.com'
    fill_in 'Password', with: 'password'
    find('#team-member-checkbox').click
    click_button 'Create Team member'

    expect(page).to have_content('Team Member was successfully created')
  end

  scenario 'with invalid team member attributes' do
    click_link 'New'

    fill_in 'First name', with: ''
    click_button 'Create Team member'

    expect(page).to have_content('Team member has not been created')
  end
end
