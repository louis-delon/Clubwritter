class ThemesController < ApplicationController

  def index
    @themes = Theme.all
  end

  def new
    @theme = Theme.new
  end

  def create

  end

  private

  def theme_params
    params.require(:theme).permit(:name, :deadline, :category_id, :user_id)
  end

end
