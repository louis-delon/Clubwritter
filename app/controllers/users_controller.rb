class UsersController < ApplicationController

  before_action :user_is_owner, only: [:edit, :update]

  def index
  end

  def show
    @user = User.find(params[:id])
    @user_avatar = @user.avatar || "default-avatar.png"
    authorize @user
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:pseudo)
  end

  def user_is_owner
    @user = current_user
    authorize @user
  end

end
