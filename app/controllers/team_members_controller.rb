class TeamMembersController < ApplicationController
  set_current_tenant_through_filter 
  before_action :set_current_account 
  devise_group :team_member, contains: [:user]
  layout "dashboard"


  def index 
    @team_members = TeamMember.order(:email)
    current_user.email
  end

  def new 
    @team_member = TeamMember.new
  end

  def create 
    @team_member = TeamMember.new(team_member_params)

    respond_to do |format|
      if @team_member.save 
        format.html { redirect_to team_members_path, notice: "Team Member has been successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end



  private 

  def team_member_params
    params.require(:team_member).permit(:first_name, :last_name, :email, :password)
  end

  def set_current_account 
    return unless current_user.present? 
    current_account = current_user.account 
    ActsAsTenant.current_tenant = current_account 
  end
end