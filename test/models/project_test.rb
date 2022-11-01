# == Schema Information
#
# Table name: projects
#
#  id             :uuid             not null, primary key
#  user_id        :uuid             not null
#  project_name   :text             not null
#  description    :text             not null
#  project_number :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  account_id     :uuid             not null
#
require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
