class ThemesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :ended, :show]
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  def index
    @themes = policy_scope(Theme).sort_by { |theme| theme.deadline }
    @pending_themes = @themes.select { |theme| !deadline_is_passed?(theme) }
  end

  def ended
    # we show here only themes wich are ended (deadline has been past)
    # allow to dissociate themes which are ended from themes which are pending
    @themes = policy_scope(Theme)
    @ended_themes = @themes.select { |theme| theme if deadline_is_passed?(theme) }
    authorize @themes
  end

  def new
    @theme = Theme.new
    @categories = Category.all.sort_by { |category| category.name}
    authorize @theme
  end

  def create
    @theme = Theme.new(theme_params)
    @categories = Category.all.sort_by { |category| category.name}
    @theme.user = current_user
    authorize @theme
    if @theme.save
      redirect_to theme_path(@theme)
    else
      render :new
    end
  end

  def show
    #calculate the number of day before the end of the inscription period
    @number_of_days = number_of_days_for_apply(@theme.deadline)
    #allow to show all the post of the theme
    @posts = Post.where(theme_id: @theme.id)
    if user_signed_in?
      @post = Post.find_by(theme_id: @theme.id, user_id: current_user.id)
    end
  end

  def edit
    @categories = Category.all.sort_by { |category| category.name}
  end

  def update
    @theme.update(theme_params)
    redirect_to theme_path(@theme), notice: "votre article a été modifé avec succès"
  end

  def destroy
    @theme.destroy
    redirect_to themes_path, notice: "votre article a été supprimé avec succès"
  end


private

  def deadline_is_passed?(theme)
    theme.deadline.past?
  end

  def theme_has_a_post?(theme)
    theme.posts.any?
  end

  def number_of_days_for_apply(deadline)
    #number of day before the theme ends.After this deadline, user can't write a post
    deadline.mjd-DateTime.now.mjd
  end

  def set_theme
    @theme = Theme.find(params[:id])
    authorize @theme
  end

  def theme_params
    params.require(:theme).permit(:name, :deadline, :photo_cache, :category_id, :user_id, :photo)
  end
end
