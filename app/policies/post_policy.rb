class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    !theme_is_published?
  end

  def edit?
    update?
  end

  def update?
    user_is_owner? && !theme_is_published?
  end

  def destroy?
   user_is_owner? && !theme_is_published?
  end

  private

  def user_is_owner?
    user == @record.user
  end

  def theme_is_published?
    @record.theme.deadline.past?
  end

end
