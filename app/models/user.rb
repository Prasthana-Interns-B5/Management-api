class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :lockable, :timeoutable, :trackable

  validates :email, presence: true
  belongs_to :employee
  has_many :user_logins

  ReferenceDatum.where(data_type: :employee_role).pluck(:key).each do |employee_role|
    define_method "#{employee_role.gsub('ur_', '')}?" do
      employee_role == role
    end
  end
end
