# frozen_string_literal: true

class AddAccountToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :account, null: false, foreign_key: true, type: :uuid
  end
end
