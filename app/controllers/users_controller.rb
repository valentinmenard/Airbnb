class UsersController < ApplicationController
  def profile
  end

  def bookings_sent

  end

  def my_flats
    @flats = current_user.flats
  end
end