require 'rails_helper'

RSpec.describe "ViewingProjects", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "allows the user to view the projects " do
    sign_up
    click_link "View projects"

    expect(page).to have_content("Kurosaki's projects")

  end

  it "allows for creation of new project" do 
    sign_up

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  it "allows the user to create a new project" do 
    go_to_projects_page
    click_link "New"

    expect(page).to have_content("New Project")
    expect(page).to have_content("Project Details")
  end

  it "creates a new project with valid attributes" do 
    go_to_projects_page 
    click_link "New"


    fill_in "Project name", with: "Sample project for this week"
    fill_in "Description", with: "Sample description"
    click_button "Create Project"
    expect(Project.count).to eq(1)
  end

  def go_to_projects_page
    sign_up 
    click_link "View projects"
  end


  def sign_up 
    visit root_url 

    click_link "Sign in"
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
