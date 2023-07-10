class Employee < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  validates :name,:role,presence: true
  after_create :set_employee_no
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :questions
  has_many :answers
  has_many :points
  has_many  :feedbacks
      
  ROLES = %w{HR manager subordinate}
  validates :role, inclusion: { in: ROLES,
  message: "%{value} is not valid." }

  def jwt_payload
    super
  end

  def on_jwt_dispatch(token, payload)
    @auth_token = token
  end

  def auth_token
    @auth_token
  end
 
  def expiration_time
    decoded_token = JWT.decode(@auth_token,Rails.application.credentials.fetch(:secret_key_base), true, { algorithm: 'HS256' })
    payload = decoded_token.first
    payload['exp']
  end
   
  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end

  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id",dependent: :destroy

  belongs_to :manager, class_name: "Employee", optional: true,dependent: :destroy


private


  def set_employee_no
    self.employee_no = "2023-#{self.id}"
  end
end
