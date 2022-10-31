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
#
class Project < ApplicationRecord
  belongs_to :user
end
