class AddAccountToActivities < ActiveRecord::Migration[7.0]
  def change
    add_reference :activities, :account, null: false, foreign_key: true, type: :uuid
  end
end
