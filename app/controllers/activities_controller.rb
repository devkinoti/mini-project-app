class ActivitiesController < ApplicationController
  layout "dashboard"
  devise_group :project_member, contains: [:user, :team_member]
  
  before_action :authenticate_project_member!

  def index
    @activities = PublicActivity::Activity.order(created_at: :desc)
  end
end
