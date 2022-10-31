class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :name, null: false, 
        comment: "This is the users business account where multiple sub users can be added"
        
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
