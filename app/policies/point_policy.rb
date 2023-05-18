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

  # def create?
  #   @employee.subordinate?
  # end

  # def update?
  #     @employee.subordinate? && @employee.id == @record.id
  #   end

  # def destroy?
  #   @employee.HR? || @employee.manager?
  # end
end
