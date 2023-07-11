class Employee < ApplicationRecord


  include Devise::JWT::RevocationStrategies::JTIMatcher
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
    if params.present?
      search_manager = params[:role] if params[:role].present?
      managers = Employee.where(role: search_manager).where("LOWER(name) LIKE :query ", query: "%#{params[:query]}%")
    else 
      Employee.all 
    end
  end

  def jwt_payload
    super
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
