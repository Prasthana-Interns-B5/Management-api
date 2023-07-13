class OneOnOnePolicy

  attr_reader :employee, :record

  def initialize(employee, record)
    @employee = employee
    @record = record
  end

  def create?
    @employee.ur_manager?
  end

  def update?
    @employee.id == @record.employee_id
  end

  def destroy?
    @employee.id == @record.employee_id
  end

end