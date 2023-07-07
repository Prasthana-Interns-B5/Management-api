class EmployeesController < ApplicationController
#before_action :authenticate_employee!
  
def index
    employees = Employee.all
    authorize employees
    render json: employees, status: 200
  end

  def show
    employee = Employee.find(params[:id])
   authorize employee
    render json: employee, status: 200
  end

  def create_first_employee
    if Employee.count.zero?
    employee = Employee.create(employee_params)
    if employee.save
      render json: {message: "Employee Signed Up Successfully",data: employee}, status: 200
    else
      render json: {message: "Employee Cannot be created", error: employee.errors.full_messages}
    end
    else
      render json: {message: "Employee Cannot be created"}
  end
end



def generate_otp
  updated_password = SecureRandom.random_number(100000..999999).to_s
  email = params[:email]
  employee = Employee.find_by(email: email)
  employee.update!(password: updated_password)
  EmailMailer.otp_email(email,updated_password).deliver_now
  render json: {message:'OTP generated and sent!'}
end

  def update
    employee = Employee.find(params[:id])
    authorize employee
    if employee.update(employee_params)
      render json: employee, status: 200
    else
      render json: {message: "Employee cannot be updated", error: employee.errors.full_messages}
    end
  end

  def destroy
    employee = Employee.find(params[:id])
    authorize employee
    employee.destroy
    render json: {message: "Record Destroyed Successfully"},status: 204
  end

  def subordinates
    manager = Employee.find(params[:id])
    subordinates = manager.subordinates
     authorize manager
    render json: subordinates, status: 200
  end

  def queries
    employee = Employee.find(params[:id])
    queries = employee.questions
    authorize employee
    render json: queries, status: 200
  end

  def scores
    employee = Employee.find(params[:id])
    scores = employee.points
    authorize employee
    render json: scores, status: 200
  end

  def managers
    managers = Employee.where(role: "manager")
   authorize managers
    render json: managers, status: 200
  end


   def role
    employee = Employee.find(params[:id])
    authorize employee
    if employee.update(role_params)
      render json: employee, status: 200
    else
      render json: {message: "Employee cannot be updated", error: employee.errors.full_messages},status: 304
    end

  end

  def reviews
    employee=Employee.find(params[:id])
    feedback=employee.feedbacks
     authorize employee ,:show?
    render json: feedback ,status:200
  end

  def test  
    render json: current_employee
  end


  private

  def employee_params
    params.permit(:email,:password,:name,:role,:manager_name,:manager_id)
  end
  def role_params
    params.require(:employee).permit(:role,:manager_id,:manager_name)
  end

end
