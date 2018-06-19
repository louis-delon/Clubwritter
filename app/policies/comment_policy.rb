class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.signed_in?
  end

  def edit?
    update?
  end

  def update?
    user_is_owner?
  end

  def destroy?
    update?
  end

  private

  def user_is_owner?
    user == record.post.user
  end

end
