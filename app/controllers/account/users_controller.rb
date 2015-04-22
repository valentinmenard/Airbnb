class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def show
    @user = current_user
    @flats = current_user.flats
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :picture)
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
