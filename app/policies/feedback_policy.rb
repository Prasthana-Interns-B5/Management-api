class FeedbackPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end


  attr_reader :employee, :record

  def initialize(employee, record)
    @employee = employee
    @record = record
  end


  def index?
    @employee.HR?
  end

  def show?
    @employee.HR? || @employee.manager? 
  end
  
  def destroy?
    @employee.manager?
  end

  def comments?
    @employee.subordinate?
  end

end



