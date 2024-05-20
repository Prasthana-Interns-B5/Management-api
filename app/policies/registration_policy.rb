# frozen_string_literal: true

class RegistrationPolicy
  # class Scope < Scope
  #   # NOTE: Be explicit about which records you allow access to!
  #   # def resolve
  #   #   scope.all
  #   # end
  # end
  # def respond_with?
  #   @employee.HR?
  # end
  attr_reader :employee, :record

  def initialize(employee, record)
    @employee = employee
    @record = record
  end

  def create?
    @employee.ur_hr?
  end

  # def update?
  #   @employee.id == @record.id
  # end

  # def destroy?
  #   @employee.HR?
  # end
end
