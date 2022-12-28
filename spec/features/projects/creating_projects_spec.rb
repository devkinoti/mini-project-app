require "rails_helper"

RSpec.feature "Users can create new projects" do 
  let(:user) do 
    FactoryBot.create(:user)
  end

  before do 
    login_as(user)

    visit projects_path 
    click_link "New"
  end

  scenario "with valid attributes" do 
    fill_in "Project name", with: "Sample project"
    fill_in "Description", with: "Sample description"
    click_button "Create Project"

    expect(page).to have_content "Project was successfully created"
    
  end
end