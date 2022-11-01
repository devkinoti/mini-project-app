class TeamMembers::SessionsController < Devise::SessionsController 
  

  protected

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end


  def after_sign_out_path_for(resource)
    new_team_member_session_path
  end
end