# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can sign out' do
  let(:user) do
    FactoryBot.create(:user)
  end

  before do
    # user.confirm
    login_as(user)
  end

  scenario do
    visit dashboard_index_url

    # byebug
    click_button 'Log Out'
    expect(page).to have_content 'Signed out successfully'
  end
end
