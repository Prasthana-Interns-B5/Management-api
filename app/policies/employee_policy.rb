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
    @employee.HR?
  end

  def show?
    @employee.HR? || @employee.id == @record.id || @employee.manager_id == @record.id
  end

  def update?
    @employee.id == @record.id
  end

  def create?
    @employee.HR?
  end

  def destroy?
    @employee.HR?
  end

  def subordinates?
    @employee.manager? || @employee.HR? || @employee.manager_id == @record.id
  end

 def queries?
  @employee.id == @record.id
 end

 def scores?
  @employee.id == @record.id
 end

 def managers?
  @employee.HR?
 end

  def role?
    @employee.HR?
  end

end
