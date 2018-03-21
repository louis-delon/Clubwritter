class ThemePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    owner_is_user? && !deadline_is_passed?
  end

  def destroy?
    owner_is_user? && !deadline_is_passed?
  end

  private

  def owner_is_user?
    @record.user == user
  end

  def deadline_is_passed?
    @record.deadline.past?
  end

end
