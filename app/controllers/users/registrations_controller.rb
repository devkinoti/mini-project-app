# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    protected

    def after_update_path_for(resource)
      profile_path(resource)
    end
  end
end
