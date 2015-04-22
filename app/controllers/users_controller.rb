class UsersController < ApplicationController
  def profile
  end

  def my_flats
    @flats = current_user.flats
    raise
  end
end