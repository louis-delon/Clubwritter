class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @user_avatar = @user.avatar || "default-avatar.png"
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
  end
end
