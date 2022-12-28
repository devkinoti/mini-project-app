require "rails_helper"

RSpec.feature "Users can delete projects" do 
  let(:user) do 
    FactoryBot.create(:user)
  end

  let(:project) do 
    FactoryBot.create(:project, user: user, account: user.account, )
  end

  before do 
    login_as(user)

    visit project_path(project)
  end

  scenario "successfully" do 
    click_link "Destroy"

    expect(page).to have_content "Project was successfully destroyed"
    expect(page.current_url).to eq(projects_url)
  end
end