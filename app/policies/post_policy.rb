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

  def show?
    # false If the post is private and current user has not published a
    # post in the theme, true if post is public
    @record.private? && user_has_a_post? ? false : true
    # raise

  end

  def edit?
    update?
  end

  def update?
    user_is_owner? && !theme_is_published? && user_has_a_post?
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

  def user_has_a_post?
    Post.exists?(theme_id: @record.theme.id, user_id: user.id)
  end

end
