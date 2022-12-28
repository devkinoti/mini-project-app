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
  end

  scenario "with project details" do 
    expect(page).to have_content("Sample project")
    expect(project.account).to eq(user.account)
  end


end