class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :lockable, :timeoutable, :trackable

  validates :email, presence: true
  belongs_to :employee
  has_many :user_logins, dependent: :destroy

  default_scope { where(active: true) }

  def self.current_user
    Thread.current[:current_user]
  end

  def self.current_user=(user)
    Thread.current[:current_user] = user
  end

  def manager?
    return if employee.blank?

    employee.team_members.present?
  end
end
