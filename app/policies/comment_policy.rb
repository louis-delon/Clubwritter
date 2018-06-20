class CommentPolicy < ApplicationPolicy

  def create?
    !user.nil?
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
