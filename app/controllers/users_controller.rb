class UsersController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  # before_action :user_is_owner, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
  end

  def show
    @user_avatar = @user.avatar || "default-avatar.png"
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:pseudo, :avatar)
  end

  # def user_is_owner
  #   @user = current_user
  #   authorize @user
  # end

end
