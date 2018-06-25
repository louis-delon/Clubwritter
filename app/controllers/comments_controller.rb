class CommentsController < ApplicationController

  before_action :set_post
  before_action :set_theme

  def create

    @comment = Comment.new(comment_params)
    @user = current_user
    @post.theme = @theme
    @comment.post = @post
    @comment.user = @user
    authorize @comment
    if @comment.save
      respond_to do |format|
        format.html { redirect_to theme_post_path(@theme, @post) }
        format.js { }
      end
    else
      respond_to do |format|
        format.html { render 'posts/show' }
        format.js { }
      end
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
