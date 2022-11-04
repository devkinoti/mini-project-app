require 'rails_helper'

RSpec.describe "CreatingAccounts", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "shows the root page" do 
    visit root_url

    expect(page).to have_content("Sign in as account owner")
  end

  it "shows the sign in for team members link" do 
    visit root_url 

    expect(page).to have_content("Sign in as team member")
  end

  it "show the user the option to create account" do 
    visit root_url

    click_link "Sign in as account owner"
    expect(page).to have_content("Create a new account")

  end

  it "shows user option to sign in as team member" do 
    visit root_url 

    click_link "Sign in as account owner"
    expect(page).to have_content("Login as team member")
  end

  it "shows user the create a new account page" do 
    visit root_url 

    click_link "Sign in as account owner"
    click_link "Create a new account"
    expect(page).to have_content("Register")
  end

  it "allows user to create a new account" do 
    sign_up

    expect(Account.all.count).to eq(1)
    expect(User.all.count).to eq(1)
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  it "allows a new user to be created" do 
    sign_up

    expect(User.all.count).to eq(1)

  end

  it "shows a successful sign up notification" do 

    sign_up

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  it "greets the user" do 
    sign_up

    expect(page).to have_content("Hello, Kurosaki!")
  end

  it "displays number of projects by month" do 
    sign_up

    expect(page).to have_content("Total Project Volume by Month")
  end

  it "displays the name of the user" do 
    sign_up

    expect(page).to have_content("Kurosaki Ichigo")
  end

  it "displays view projects" do 
    sign_up

    expect(page).to have_content("View projects")
  end

  def sign_up 
    visit root_url 

    click_link "Sign in as account owner"
    click_link "Create a new account"

    fill_in "First Name", with: "Kurosaki"
    fill_in "Last Name", with: "Ichigo"
    fill_in "Email address", with: "kurosaki@bankai.com"
    fill_in "Password", with: "password22"
    fill_in "user[password_confirmation]", with: "password22"
    check "user[terms_agreement]"
    click_button "Sign up"
    
  end
end
