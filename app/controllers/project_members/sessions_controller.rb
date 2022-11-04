class ProjectMembers::SessionsController < Devise::SessionsController
  devise_group :project_member, contains: [:user, :team_member]
  
  before_action :authenticate_project_member!

  protected 

  def after_update_path_for(resource)
    profile_path(resource)
  end
end