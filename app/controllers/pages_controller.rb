class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def home
    @flats= Flat.all
  end

  def about
  end

  def index
  end

end