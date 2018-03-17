class ThemesController < ApplicationController

  before_action :set_theme, only: [:new, :create, :show]

  def index
    @themes = policy_scope(Theme)
  end

  def new
    @theme = Theme.new
  end

  def create

  end

  def show
    @all_posts = Post.where(theme_id: @theme.id)
    @current_user_post = Post.where(theme_id: @theme.id, user_id: current_user.id)
    #calculate the number of day before the end of the inscription period
    @number_of_days = number_of_days_for_apply(@theme.deadline)
    authorize @theme
    # binding.pry
    # @post = Post.where("user_id = ?, current_user.id")
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

end
