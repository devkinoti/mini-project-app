class DashboardController < ApplicationController
  layout "dashboard"
  devise_group :project_member, contains: [:user, :team_member]
  
  before_action :authenticate_project_member!

  

  
  def index
    
  end
end
