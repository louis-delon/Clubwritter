class ThemesController < ApplicationController

  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  def index
    @themes = policy_scope(Theme)
  end

  def new
    @theme = Theme.new
    @categories = Category.all.sort_by { |category| category.name}
    authorize @theme
  end

  def create
    @theme = Theme.new(theme_params)
    @theme.user = current_user
    authorize @theme
    if @theme.save
      redirect_to theme_path(@theme)
    else
      render :new
    end
  end

  def show
    @posts = Post.all
    @current_user_post = user_has_a_post(current_user)
    #calculate the number of day before the end of the inscription period
    @number_of_days = number_of_days_for_apply(@theme.deadline)
    @post = Post.new
    @post.theme_id = @theme.id
    @post.user_id = current_user.id
    authorize @theme
  end

  def edit
    @categories = Category.all.sort_by { |category| category.name}
    authorize @theme
  end

  def update
    @theme.update(theme_params)
    authorize @theme
    redirect_to theme_path(@theme), notice: "votre texte a été modifé avec succès"
  end

  def destroy
    @theme.destroy
    authorize @theme
    redirect_to themes_path
  end

  private

  def number_of_days_for_apply(deadline)
    deadline.mjd-DateTime.now.mjd
  end

  def set_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(:name, :deadline, :category_id, :user_id)
  end

  def user_has_a_post(user)
    Post.where(theme_id: @theme.id, user_id: user.id)
  end

end
