class TeamMembersController < ApplicationController
  devise_group :team_member, contains: [:user]
  layout "dashboard"


  def index 
    @team_members = TeamMember.order(:email)
    current_user.email
  end

  def new 
    @team_member = TeamMember.new
  end





  private 


end