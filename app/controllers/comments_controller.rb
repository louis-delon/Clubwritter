class CommentsController < ApplicationController

  before_action :set_post
  before_action :set_theme

  def index
    @comments = policy_scope(Comment)
  end

  def create
    @comment = Comment.new(post_id: @post.id)
    authorize @comment
  end

  def edit
    @comment = Comment.find(:id)
    authorize @comment
  end

  def update
    authorize @comment
  end

  def destroy
    authorize @comment
  end

private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_theme
    @theme = Theme.find(params[:theme_id])
  end

end
