class PagesController < ApplicationController
  def home
    @flats= Flat.all
  end

  def about
  end

  def index
  @flats = Flat.search(params[:search])
  end

end
