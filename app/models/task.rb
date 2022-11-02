class Task < ApplicationRecord
  acts_as_tenant(:account)
  belongs_to :project

  has_and_belongs_to_many :team_members
end
