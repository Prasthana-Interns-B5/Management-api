class OneOnOnePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def permitted_attributes
    %i[participant_id start_date_time end_date_time notes feedback_rating]
  end

  def index?
    create?
  end

  def show?
    record.can_view?(user)
  end

  def create?
    user.employee.present? && !user.is_admin
  end

  def update?
    user.manager?
  end

  def destroy?
    update?
  end

  def create_permission
    if create?
      { access: ReferenceDatum::KEY_ENABLED }
    else
      { access: ReferenceDatum::KEY_NOT_AVAILABLE }
    end
  end

  def update_permission
    if update?
      { access: ReferenceDatum::KEY_ENABLED }
    else
      { access: ReferenceDatum::KEY_NOT_AVAILABLE }
    end
  end

  def destroy_permission
    create_permission
  end

  def index_permission
    if index?
      { access: ReferenceDatum::KEY_ENABLED }
    else
      { access: ReferenceDatum::KEY_NOT_AVAILABLE }
    end
  end
end
