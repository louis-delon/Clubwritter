class CommentsController < ApplicationController

  before_action :set_post
  before_action :set_theme

  def create
    @comment = Comment.new(comment_params)
    @post.theme = @theme
    @comment.post = @post
    authorize @comment
    if @comment.save
      redirect_to theme_post_path(@theme, @post)
    else
      render 'posts/show'
    end
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

  def comment_params
    params.require(:comment).permit(:message)
  end

end
