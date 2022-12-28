require "rails_helper"

RSpec.feature "Users can create new team members" do 
  let(:user) do 
    FactoryBot.create(:user)
  end

  before do 
    login_as(user)
  end

  scenario "with valid team member attributes" do 
    
  end
end