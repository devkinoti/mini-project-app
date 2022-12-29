# frozen_string_literal: true

class CreateTasksTeamMembersJoin < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks_team_members do |t|
      t.references :task, type: :uuid
      t.references :team_member, type: :uuid
    end
  end
end
