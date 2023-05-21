class QuestionPolicy
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

  # def index?
  #   @employee.HR?
  # end

  # def show?
  #   @employee.HR?
  # end

  # def create?
  #   @employee.subordinate?
  # end

  # def update?
  #     @employee.subordinate? && @employee.id == @record.id
  #   end

  def destroy?
    @employee.id == @record.employee_id
  end

end
