class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update]
  before_action :set_theme, only: [:index, :new, :create, :show]

  def index
  end

  def new
    @post = Post.new
    authorize @post

  end

  def create
    @post = Post.new(
      theme_id: @theme.id,
      user_id: current_user.id,
      category_id: @theme.category_id,
      content: params[:post][:content]
      )
    if @post.save
      redirect_to theme_posts_path(@theme)
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    @post.update(post_params)
  end

  private

  def set_theme
    @theme = Theme.find(params[:theme_id])
  end

  def set_post
    @post = Post.find(params[:id])
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
