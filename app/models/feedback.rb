class Feedback < ApplicationRecord
  belongs_to :employee
  before_validation :set_employee_id

  scope :with_year_and_month, ->(year, month) {
  date = DateTime.new(year,month)
  where(created_at: date...date.next_month)
}

  private
  def set_employee_id 
    self.employee_id=Current.employee.id
  end

  def self.individual_feedback(params)
    feedback=Feedback.where(employee_id:params[:id])
    if params[:feedback_type].present?
      feedback.where(feedback_type:params[:feedback_type])
    else
      feedback
    end
  end

end
