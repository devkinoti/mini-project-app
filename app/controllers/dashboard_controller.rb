class DashboardController < ApplicationController
  layout "dashboard"
  devise_group :user, contains: [:team_member]
  
  def index
  end
end
