# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can remove team members' do
  let(:user) do
    FactoryBot.create(:user)
  end

  let(:team_member) do
    FactoryBot.create(:team_member, account: user.account)
  end

  let(:project) do
    FactoryBot.create(:project, user:, account: user.account)
  end

  let(:task) do
    FactoryBot.create(:task, project:, account: user.account)
  end

  before do
    login_as(user)

    task.team_members << team_member

    visit project_task_path(project, task)
  end

  scenario 'from a specific task' do
    click_button 'Remove from task'

    expect(page).to have_current_path(project_task_path(project, task))
  end
end
