# class TeamMembers::RegistrationsController < Devise::RegistrationsController 
#   byebug
#   set_current_tenant_through_filter 
#   before_action :set_current_account 


  
#   protected

#   def after_sign_up_path_for(resource)
#     team_members_path
#   end
  
#   private 

#   def set_current_account 
#     return unless current_user.present? 
#     current_account = current_user.account 
#     ActsAsTenant.current_tenant = current_account 
#   end


  


# end