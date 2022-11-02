class TeamMembersController < ApplicationController 
  set_current_tenant_through_filter 
  before_action :set_current_account 
  layout "dashboard"

  devise_group :project_member, contains: [:user, :team_member]
  
  before_action :authenticate_project_member!



  def index 
    @pagy, @team_members = pagy(TeamMember.order(created_at: :desc), items: 10)
  end

  def new 
    @team_member = TeamMember.new
  end

  def show 
    @team_member = TeamMember.find(params[:id])
  end

  def edit

  end

  def update
    
  end


  def create 
    @team_member = TeamMember.new(team_member_params)
    respond_to do |format|
      if @team_member.save
        
        format.html { redirect_to team_members_path, notice: "Team Member was successfully created." }
        
      else
        format.html { render :new, status: :unprocessable_entity }
       
      end
    end
  end

  private

  def team_member_params
    params.require(:team_member).permit(:first_name, :last_name, :email, :password, :terms_agreement)
  end

  def set_current_account 
    return unless current_user.present?
    current_account = current_user.account 
    ActsAsTenant.current_tenant = current_account
  end


end