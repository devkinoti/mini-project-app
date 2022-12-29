# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can view team members' do
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

  scenario 'team member for a project' do
    expect(page).to have_content(team_member.full_name)
  end
end
