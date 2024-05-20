# frozen_string_literal: true

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

  def index?
    @employee.manager?
  end

  def show?
    @employee.manager? || @employee.id == @record.employee_id
  end

  def create?
    @employee.subordinate?
  end

  def update?
    @employee.id == @record.employee_id
  end

  def replies
    @employee.id == @record.employee_id
  end

  def destroy?
    @employee.id == @record.employee_id
  end
end
