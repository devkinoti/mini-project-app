require 'rails_helper'

RSpec.describe TeamMember, type: :model do
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
  it "has custom attributes" do 
    project_member = TeamMember.new(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com", 
      password: "password", 
      password_confirmation: "password",
      account: @user.account
    )

    expect(project_member).to be_valid
  end

  it "has belongs to a user account" do 
    project_member = TeamMember.new(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com", 
      password: "password", 
      password_confirmation: "password",
      account: nil
    )

    expect(project_member).to_not be_valid
  end

  it "has a first name" do 
    project_member = TeamMember.new(
      first_name: "",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com", 
      password: "password", 
      password_confirmation: "password",
      account: @user.account
    )

    expect(project_member).to_not be_valid
  end

  it "has a last name" do 
    project_member = TeamMember.new(
      first_name: "sample",
      last_name: "",
      terms_agreement: true,
      email: "sample@gmail.com", 
      password: "password", 
      password_confirmation: "password",
      account: @user.account
    )

    expect(project_member).to_not be_valid

  end

  it "terms and agreement must be accepted" do 
    project_member = TeamMember.new(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: false,
      email: "sample@gmail.com", 
      password: "password", 
      password_confirmation: "password",
      account: @user.account
    )

    expect(project_member).to_not be_valid
  end

  it "has a valid email address" do 
    project_member = TeamMember.new(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail..gmail.com.au", 
      password: "password", 
      password_confirmation: "password",
      account: @user.account
    )

    expect(project_member).to_not be_valid
  end

  PublicActivity.with_tracking do 
    it "has a unique email address" do 
      first_project_member = TeamMember.create!(
        first_name: "sample",
        last_name: "sample",
        terms_agreement: true,
        email: "sample@gmail.com", 
        password: "password", 
        password_confirmation: "password",
        account: @user.account
      )

      project_member = TeamMember.new(
        first_name: "sample",
        last_name: "sample",
        terms_agreement: true,
        email: "sample@gmail.com", 
        password: "password", 
        password_confirmation: "password",
        account: @user.account
      )

      expect(project_member).to_not be_valid
    end
  end


  it "displays a capitalized full name" do 
    project_member = TeamMember.new(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com", 
      password: "password", 
      password_confirmation: "password",
      account: @user.account
    )

    expect(project_member.full_name).to eq("Sample Sample")
  end

  it "display the team members name by default" do 
    project_member = TeamMember.new(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com", 
      password: "password", 
      password_confirmation: "password",
      account: @user.account
    )

    expect(project_member.to_s).to eq("sample sample")
  end
end
