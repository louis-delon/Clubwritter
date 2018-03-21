class PostsController < ApplicationController

  before_action :set_post, only: [:show]
  before_action :set_theme, only: [:index, :new, :create, :show, :edit, :update]
  before_action :set_current_user_post, only: [:edit, :update]

  def index
    @posts = policy_scope(Post)
  end

  def new
    @post = Post.new
    @post.theme_id = @theme.id
    authorize @post
  end

  def create
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

  def show
  end

  def edit
    authorize @post
  end

  def update
    @post.update(post_params)
    authorize @post
    redirect_to theme_path(@theme), notice: "votre article a été mis à jour!"
  end

  private

  def set_theme
    @theme = Theme.find(params[:theme_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_current_user_post
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
