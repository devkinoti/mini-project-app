# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Team members can sign out' do
  let(:user) do
    FactoryBot.create(:user)
  end

  let(:team_member) do
    FactoryBot.create(:team_member, account: user.account)
  end

  before do
    # user.confirm
    login_as(team_member)
  end

  scenario do
    visit dashboard_index_url

    # byebug
    click_button 'Log Out'
    expect(page).to have_content 'Signed out successfully'
  end
end
