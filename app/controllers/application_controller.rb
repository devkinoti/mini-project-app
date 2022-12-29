# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  include PublicActivity::StoreController

  include Pagy::Backend

  protected

  def after_sign_in_path_for(_resource)
    dashboard_index_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name terms_agreement])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end

  private

  def layout_by_resource
    if devise_controller?
      'dashboard'
    else
      'application'
    end
  end
end
