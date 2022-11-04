require 'rails_helper'

RSpec.describe User, type: :model do
  it "has custom attributes" do 
    user = User.new(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com", 
      password: "password", 
      password_confirmation: "password"
    )
    expect(user).to be_valid
  end

  it "must have a first name" do 
    user = User.new(
      first_name: "",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com",
      password: "password",
      password_confirmation: "password"
    )

    expect(user).to_not be_valid
  end

  it "must have a last name" do 
    user = User.new(
      first_name: "sample",
      last_name: "",
      terms_agreement: true,
      email: "sample@gmail.com",
      password: "password",
      password_confirmation: "password"
    )

    expect(user).to_not be_valid
  end

  it "must accept a terms of agreement" do 
    user = User.new(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: false,
      email: "sample@gmail.com",
      password: "password",
      password_confirmation: "password"
    )

    expect(user).to_not be_valid
  end

  it "has a valid email address" do 
    user = User.new(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.gmail.1234..com",
      password: "password",
      password_confirmation: "password"
    )

    expect(user).to_not be_valid
  end

  it "has a unique email address" do 
    first_user = User.create(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com",
      password: "password",
      password_confirmation: "password"
    )

    user = User.new(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com",
      password: "password",
      password_confirmation: "password"
    )

    expect(user).to_not be_valid
  end


  it "has a password and password confirmation" do
    user = User.new(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com",
      password: "",
      password_confirmation: ""
    )

    expect(user).to_not be_valid
  end

  it "has an account" do 
    user = User.create!(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com",
      password: "password",
      password_confirmation: "password"
    )

    expect(user.account).to_not be_nil
  end

  it "displays 'first_name-last_name' as default" do 
    user = User.create!(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com",
      password: "password",
      password_confirmation: "password"
    )

    expect(user.to_s).to eq("sample-sample")
  end

  it "returns the full name" do 
    user = User.create!(
      first_name: "sample",
      last_name: "sample",
      terms_agreement: true,
      email: "sample@gmail.com",
      password: "password",
      password_confirmation: "password"
    )

    expect(user.full_name).to eq("sample sample")
  end
end
