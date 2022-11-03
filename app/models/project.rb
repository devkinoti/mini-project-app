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
class Project < ApplicationRecord
  acts_as_tenant(:account)
  belongs_to :user

  has_many :tasks

  # validations
  validates :project_name, presence: true 
  validates :description, presence: true

  # Public activity tracking
  include PublicActivity::Model 
  tracked owner: Proc.new { |controller, model| controller.current_user }
  

  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy

  def to_s
    project_name
  end
end
