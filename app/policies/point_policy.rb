class PointPolicy
  # class Scope < Scope
  #   # NOTE: Be explicit about which records you allow access to!
  #   # def resolve
  #   #   scope.all
  #   # end
  # end
  attr_reader :employee, :record

  def initialize(employee, record)
    @employee = employee
    @record = record
  end

  def index?
    @employee.HR? || @employee.manager?
  end

  def show?
    @employee.id == @record.employee_id
  end

 def manager_score?
  @employee.manager?
 end

  def create?
    @employee.subordinate?
  end

  def update?
    @employee.id == @record.employee_id
  end

  def destroy?
    @employee.id == @record.employee_id
  end
end
