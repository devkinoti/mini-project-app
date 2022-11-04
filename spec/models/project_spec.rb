require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:example) do 
    @user = User.create!(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com", 
      password: "password", 
      password_confirmation: "password"
    )
  end
  it "has a project name" do 
    project = Project.new(
      project_name: "",
      description: "Sample Description",
      account: @user.account,
      project_number: "sample-num-001",
      user: @user
    )

    expect(project).to_not be_valid
  end

  it "has a project description" do 
    project = Project.new(
      project_name: "Sample Project",
      description: "",
      project_number: "sample-num-001",
      account: @user.account,
      user: @user
    )

    expect(project).to_not be_valid
  end

  it "belongs to a user" do 
    project = Project.new(
      project_name: "Sample Project",
      description: "Sample Description",
      project_number: "sample-num-001",
      account: @user.account,
      user: nil
    )

    expect(project).to_not be_valid
  end

  it "display project name by default" do 
    project = Project.create!(
      project_name: "Sample Project",
      description: "sample description",
      project_number: "sample-num-001",
      account: @user.account,
      user: @user
    )

    expect(project.to_s).to eq("Sample Project")
  end


  it "belongs to user account" do 
    project = Project.new(
      project_name: "Sample Project",
      description: "Sample description",
      account: nil,
      user: @user
    )

    expect(project).to_not be_valid
  end
end
