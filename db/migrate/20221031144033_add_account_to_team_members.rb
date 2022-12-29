# frozen_string_literal: true

class AddAccountToTeamMembers < ActiveRecord::Migration[7.0]
  def change
    add_reference :team_members, :account, null: false, foreign_key: true, type: :uuid
  end
end
