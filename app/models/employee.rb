class Employee < ApplicationRecord


  include Devise::JWT::RevocationStrategies::JTIMatcher
  validates :name,:role,presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: self


  
  has_many :questions
  has_many :answers
  has_many :points
  has_many :feedbacks
  has_many :subordinates, class_name: "Employee", foreign_key: "reporting_manager_id"
  belongs_to :manager, class_name: "Employee", optional: true


  def self.filter(params)
    if params[:role].present?
      search_name = params[:name] 
      Employee.where(role: "ur_manager").where("LOWER(name) LIKE :query ", query: "%#{search_manager}%")
    else 
      Employee.where(role: "ur_manager")
    end
  end

  def self.name_search(params)
    if params.present?
      id = Current.employee.id
      search_name = params[:name]
      employees = Employee.where(reporting_manager_id:id).where("LOWER(name) LIKE :query ", query: "%#{search_name}%")
    end
  end

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

  ROLES = %w{ur_hr ur_manager ur_sr_software ur_lead ur_software_engineer}
  validates :role, inclusion: { in: ROLES,
  message: "%{value} is not valid." }
  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end
  
end
