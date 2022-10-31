class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.text :project_name, null: false, 
        comment: "The name of the project"

      t.text :description, null: false, 
        comment: "Project Description"

      t.text :project_number, null: false, 
        comment: "The project's display number within the system.This number is auto generated in app/services/project_creator"


      t.timestamps
    end
  end
end
