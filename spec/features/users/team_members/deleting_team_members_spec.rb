# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can delete team members' do
  let(:user) do
    FactoryBot.create(:user)
  end

  let(:team_member) do
    FactoryBot.create(:team_member, account: user.account)
  end

  before do
    login_as(user)

    visit team_member_path(team_member)
  end

  scenario 'successfully' do
    click_link 'Destroy'

    expect(page).to have_content('Team Member has been deleted')
    expect(page.current_url).to eq(team_members_url)
  end
end
