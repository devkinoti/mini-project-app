# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.references :project, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.text :description
      t.datetime :end_date
      t.datetime :start_date

      t.timestamps
    end
  end
end
