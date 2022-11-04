class ActivitiesController < ApplicationController
  set_current_tenant_through_filter
  before_action :set_current_account
  layout "dashboard"
  devise_group :project_member, contains: [:user, :team_member]
  
  before_action :authenticate_project_member!

  def index
    @activities = PublicActivity::Activity.order(created_at: :desc).where(owner: current_user.account)
  end


  private 

  def set_current_account 
    return unless current_user.present?
    current_account = current_user.account 
    ActsAsTenant.current_tenant = current_account
  end
end
