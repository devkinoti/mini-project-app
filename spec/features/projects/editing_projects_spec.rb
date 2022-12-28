require "rails_helper"

RSpec.feature "Users can view projects" do 
  let(:user) do 
    FactoryBot.create(:user)
  end

  let(:project) do 
    FactoryBot.create(:project, user: user, account: user.account)
  end

  before do 
    login_as(user)

    visit project_path(project)
    click_link "Edit"
  end

  scenario "with valid attributes" do
     fill_in "Project name", with: "Sample 1234"

     click_button "Update Project"

    expect(page).to have_content("Project was successfully updated")
    expect(page).to have_content("Sample 1234")
    expect(project.account).to eq(user.account)
  end

  scenario "with invalid attributes" do 
    fill_in "Project name", with: ""

    click_button "Update Project"

    expect(page).to have_content("Project has not been updated")
    
  end


end