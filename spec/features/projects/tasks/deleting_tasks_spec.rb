# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can create delete tasks for a specific project' do
  let(:user) do 
     FactoryBot.create(:user) 
  end

  let(:project) do 
    FactoryBot.create(:project, user: user, account: user.account) 
  end

  let(:task) do 
    FactoryBot.create(:task, project: project, account: user.account)
  end

  before do
    login_as(user)

    visit project_task_path(project,task)
  end

  scenario 'successfully' do
    click_link "Destroy"
    expect(page).to have_content("Task was successfully destroyed")
  end
end