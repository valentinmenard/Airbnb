class UsersController < ApplicationController
  def profile
  end

  def bookings_sent
  end

  def my_flats
    @flats = current_user.flats
  end

  def edit

  end

  def update
    current_user = User.find(:id)
    current_user.update(user_params)
  end

  private
    def user_params
      params.require(:user).permit(:name, :picture, :email, :password)
    end
end