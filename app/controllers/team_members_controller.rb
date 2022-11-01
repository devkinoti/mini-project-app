class TeamMembersController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"


  def index 
    @team_members = TeamMember.order(:email)
    current_user.email
  end

  def new 
    @team_member = TeamMember.new
  end


end