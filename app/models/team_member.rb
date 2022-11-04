# == Schema Information
#
# Table name: team_members
#
#  id                     :uuid             not null, primary key
#  first_name             :string           not null
#  last_name              :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  account_id             :uuid             not null
#  terms_agreement        :boolean          default(FALSE), not null
#
class TeamMember < ApplicationRecord
  acts_as_tenant(:account)

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :lockable, :confirmable


  # associations
  has_and_belongs_to_many :tasks

  # Public activity tracking
  include PublicActivity::Model 
  tracked owner: Proc.new { |controller, model| controller.current_project_member }
  tracked account: Proc.new { |controller, model| controller.current_project_member.account }

  has_many :activities, as: :trackable, class_name: "PublicActivity::Activity", dependent: :destroy

  # validations
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create } 
  validates_acceptance_of :terms_agreement, allow_nil: false, on: :create

  def full_name 
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
