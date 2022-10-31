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
require "test_helper"

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
