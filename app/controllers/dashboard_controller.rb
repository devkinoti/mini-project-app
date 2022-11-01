class DashboardController < ApplicationController
  layout "dashboard"
  devise_group :team, contains: [:user, :team_member]
  
  before_action :authenticate_team!

  

  
  def index
    
  end
end
