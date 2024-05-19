class Employee < ApplicationRecord
  validates :name, :role, presence: true

  has_many :questions
  has_many :answers
  has_many :points
  has_many :feedbacks
  has_many :subordinates, class_name: "Employee", foreign_key: "reporting_manager_id"
  belongs_to :manager, class_name: "Employee", optional: true


  def self.filter(params)
    if params[:name].present?
      search_name = params[:name] 
      Employee.where(role: "ur_manager").where("LOWER(name) LIKE :query ", query: "%#{search_name}%")
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
end
