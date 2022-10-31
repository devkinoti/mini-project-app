# == Schema Information
#
# Table name: accounts
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  user_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  sluq       :string
#
class Account < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged
  belongs_to :user

  # update friendly_id when slug is changed
  def should_generate_new_friendly_id?
    name_changed?
  end
end
