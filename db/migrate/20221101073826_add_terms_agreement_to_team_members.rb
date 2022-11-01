class AddTermsAgreementToTeamMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :team_members, :terms_agreement, :boolean, default: false, null: false
  end
end
