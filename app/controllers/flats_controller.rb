class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flats = Flat.find(params[:id])
  end
end
