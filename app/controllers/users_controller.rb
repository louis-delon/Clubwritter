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
    @user.update(user_params)
    authorize @user
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:pseudo)
  end

end
