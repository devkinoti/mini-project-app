# == Schema Information
#
# Table name: tasks
#
#  id          :uuid             not null, primary key
#  project_id  :uuid             not null
#  name        :string
#  description :text
#  end_date    :datetime
#  start_date  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :uuid             not null
#  status      :string
#
class Task < ApplicationRecord
  acts_as_tenant(:account)
  belongs_to :project

  has_and_belongs_to_many :team_members

  # validations
  validates :name, :description, :status, presence: true
  
  # time validations
  validates :start_date, comparison: { less_than: :end_date, message: "for the task can't be after the task's end date" }
  validates :end_date, comparison: { greater_than: :start_date, message: "for the task can't be before the task's start date"}


  TASK_STATUS = [
    "Not Started",
    "In progress",
    "Complete"
  ]
end
