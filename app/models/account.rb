# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Account < ApplicationRecord
  belongs_to :user
end
