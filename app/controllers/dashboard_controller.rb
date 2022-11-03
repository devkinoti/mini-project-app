class DashboardController < ApplicationController
  set_current_tenant_through_filter
  before_action :set_current_account
  layout "dashboard"
  devise_group :project_member, contains: [:user, :team_member]
  
  before_action :authenticate_project_member!

  

  
  def index
    total_projects_by_month = Project.group_by_month_of_year(:created_at).count 

    @month_names = []

    total_projects_by_month.keys.each do |key|
      @month_names << Date::MONTHNAMES[key]
    end

    @monthly_project_total = total_projects_by_month.values
    
  end

  private

  def set_current_account 
    return unless current_user.present?
    current_account = current_user.account 
    ActsAsTenant.current_tenant = current_account
  end
end
