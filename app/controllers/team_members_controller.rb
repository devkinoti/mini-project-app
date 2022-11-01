class TeamMembersController < ApplicationController
  devise_group :user, contains: [:team_member]
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