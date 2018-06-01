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
    # false if the post is private and current user has not published a
    # post in the theme, true if post is not private
    if user.nil?

      # user is not logged in
      post_is_private? ? false : true
    else
      # if user signed in,
      # if user has written a post in the theme return true else
      if user_has_a_post?
        true
      # if post is private and user has not a post in the theme return false
      elsif !post_is_private?
        true
      elsif post_is_private?
        false
      end
    end
  end

  def edit?
    update?
  end

  def update?
    user_is_owner?
  end

  def destroy?
   user_is_owner? && !theme_is_published?
  end

  private

  def post_is_private?
    @record.private?
  end

  def user_is_owner?
    # a priori redondant avec user_has_a_post?, to be checked
    user == @record.user
  end

  def theme_is_published?
    @record.theme.deadline.past?
  end

  def user_has_a_post?
    Post.exists?(theme_id: @record.theme.id, user_id: user.id)
  end

end
