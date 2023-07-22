class EmployeePolicy
  # class Scope < Scope
  #   # NOTE: Be explicit about which records you allow access to!
  #   def resolve
  #     scope.all
  #   end
  # end

  attr_reader :employee, :record

  def initialize(employee, record)
    @employee = employee
    @record = record
  end

  def index?
    @employee.ur_hr?
  end

  def show?
    @employee.ur_hr? || @employee.id == @record.id || @employee.reporting_manager_id == @record.id || @employee.id == @record.reporting_manager_id
  end

  def update?
    @employee.id == @record.id
  end

  def create?
    @employee.ur_hr?
  end

  def destroy?
    @employee.ur_hr?
  end

  def subordinates?
    @employee.ur_manager? || @employee.ur_hr? || @employee.reporting_manager_id == @record.id
  end

 def queries?
  @employee.id == @record.id || @employee.id == @record.reportin__manager_id
 end

end
