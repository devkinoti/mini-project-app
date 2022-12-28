require "rails_helper"

RSpec.feature "User has one account", type: :feature do 
  let(:user) do 
    FactoryBot.create(:user)
  end

  before do
    login_as(user)
  end


  scenario "after they have signed up" do 
    visit dashboard_index_path 
    expect(page).to have_content("Hello, #{user.first_name}")
    expect(user.account).not_to be_nil
  end
end