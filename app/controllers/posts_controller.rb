class PostsController < ApplicationController

  before_action :set_theme, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = policy_scope(Post)
    @user = current_user
  end

  def new
    @post = Post.new
    @post.theme_id = @theme.id
    authorize @post
  end

  def create
    # to be refactored
    @post = Post.new(
      theme_id: @theme.id,
      user_id: current_user.id,
      category_id: @theme.category_id,
      content: params[:post][:content]
      )
    authorize @post
    if @post.save
      redirect_to theme_path(@theme)
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    @post.update(post_params)
    authorize @post
    redirect_to theme_path(@theme), notice: "votre article a été mis à jour!"
  end

  def destroy
    @post.destroy
    authorize @post
    redirect_to theme_path(@theme), notice: "votre article a été supprimé"
  end

  private

  def set_theme
    @theme = Theme.find(params[:theme_id])
  end

  def set_post
    #allow to display a post only if the post belongs to current_user
    @post = Post.where(theme_id: @theme.id, user_id: current_user.id).first
  end

  def post_params
    params.require(:post)
      .permit(
        :content,
        :user_id,
        :theme_id,
        :category_id,
        :private,
      )
  end

end
