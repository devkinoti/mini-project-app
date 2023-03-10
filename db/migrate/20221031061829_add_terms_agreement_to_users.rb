# frozen_string_literal: true

class AddTermsAgreementToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :terms_agreement, :boolean, default: false, null: false
  end
end
