class UserPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    owner_is_user?
  end

  private

  def owner_is_user?
    @record == user
  end

end
