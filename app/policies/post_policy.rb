class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?

  end

  def update?

  end

  def destroy?

  end

  private

  def user_is_owner?
    user == @record.user
  end

end
