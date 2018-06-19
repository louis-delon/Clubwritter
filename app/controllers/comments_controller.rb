class CommentsController < ApplicationController

  before_action :set_comment
  before_action :set_theme

  def index
    @comments = policy_scope(Comment)
  end

  def create
    @comment = Comment.new(post_id: @post.id)
    authorize @comment
  end

  def edit

  end

  def update

  end

  def destroy

  end

private

  def set_comment
    @post = Post.find(params[:post_id])
  end

  def set_theme
    @theme = Theme.find(params[:theme_id])
  end

end
