# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can create edit tasks for a specific project' do
  let(:user) do
    FactoryBot.create(:user)
  end

  let(:project) do
    FactoryBot.create(:project, user:, account: user.account)
  end

  let(:task) do
    FactoryBot.create(:task, project:, account: user.account)
  end

  before do
    login_as(user)

    visit edit_project_task_path(project, task)
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Sample 123'
    click_button 'Update Task'

    expect(page).to have_content('Task was successfully updated')
    expect(page).to have_content('Sample 123')
  end

  scenario 'with invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Task'
    expect(page).to have_content('Task has not been updated')
  end
end
