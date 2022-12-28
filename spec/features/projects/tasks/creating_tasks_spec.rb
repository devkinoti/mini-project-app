# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can create new tasks for a specific project' do
  let(:user) do 
     FactoryBot.create(:user) 
  end

  let(:project) do 
    FactoryBot.create(:project, user: user, account: user.account) 
  end

  before do
    login_as(user)

    visit project_path(project)
    click_link 'New Project Task'
  end

  scenario 'with valid attributes and without a team member' do
    fill_in 'Name', with: "Sample task"
    fill_in "Description", with: "Sample description Lorem ipsum dolor"
    fill_in "Start date", with: DateTime.now
    fill_in "End date", with: DateTime.now + 1
    select "Not Started", from: "task_status"
    click_button 'Create Task'

    expect(page).to have_content 'Task was successfully created'
  end

  scenario 'with invalid attributes' do
    click_button "Create Task"

    expect(page).to have_content "Task has not been created"
  end
end
