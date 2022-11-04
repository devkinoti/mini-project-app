require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a name" do 
    task = Task.new(
      name: nil,
      description: "sample description",
      start_date: Time.now,
      end_date: Time.now + 1.day,
      status: Task::TASK_STATUS.first
    )

    expect(task).to_not be_valid
  end

  it "has a status" do 
    task = Task.new(
      name: "Sample Task",
      description: "sample description",
      start_date: Time.now,
      end_date: Time.now + 1.day,
      status: nil
    )

    expect(task).to_not be_valid
  end

  it "has 'Not Started', 'In Progress', 'Complete' as task statuses" do 
    expect(Task::TASK_STATUS).to eq([
      "Not Started",
      "In progress",
      "Complete"
    ])
  end

  it "has a description" do 
    task = Task.new(
      name: "Sample Task",
      description: nil,
      start_date: Time.now,
      end_date: Time.now + 1.day,
      status: nil
    )

    expect(task).to_not be_valid
  end

  it "has a start date" do 
    task = Task.new(
      name: "Sample Task",
      start_date: nil,
      end_date: Time.now + 1.day,
      status: Task::TASK_STATUS.first
    )
    expect(task).to_not be_valid
  end

  it "has an end date" do 
    task = Task.new(
      name: "Sample Task",
      start_date: Time.now,
      end_date: nil,
      status: Task::TASK_STATUS.first
    )

    expect(task).to_not be_valid
  end

  it "has a start date lesser than end date" do 
    task = Task.new(
      name: "Sample Task",
      start_date: Time.now + 1.day,
      end_date: Time.now,
      status: Task::TASK_STATUS.first
    )

    expect(task).to_not be_valid
  end


  it "has an end date greater than start date" do 
    task = Task.new(
      name: "Sample Task",
      start_date: Time.now,
      end_date: Time.now - 1.day,
      status: Task::TASK_STATUS.first
    )

    expect(task).to_not be_valid
  end

  it "displays the name of the task by default" do 
    task = Task.new(
      name: "Sample Task",
      start_date: Time.now,
      end_date: Time.now + 1.day,
      status: Task::TASK_STATUS.first
    )

    expect(task.to_s).to eq("Sample Task")
  end

  it "belongs to a project" do 
    user = User.create!(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com", 
      password: "password", 
      password_confirmation: "password"
    )

    project = Project.create!(
      project_name: "Sample Project",
      description: "Sample description",
      account: user.account,
      user: user,
      project_number: "sample-num-001"
    )

    task = Task.new(
      name: "Sample Task",
      description: "sample description",
      start_date: Time.now,
      end_date: Time.now + 1.day,
      status: Task::TASK_STATUS.first,
      project: nil,
      account: user.account
    )

    expect(task).to_not be_valid
  end

  it "belongs to an account" do 
    user = User.create!(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com", 
      password: "password", 
      password_confirmation: "password"
    )

    project = Project.create!(
      project_name: "Sample Project",
      description: "Sample description",
      account: user.account,
      user: user,
      project_number: "sample-num-001"
    )

    task = Task.new(
      name: "Sample Task",
      description: "sample description",
      start_date: Time.now,
      end_date: Time.now + 1.day,
      status: Task::TASK_STATUS.first,
      project: project,
      account: nil
    )

    expect(task).to_not be_valid
  end
end
