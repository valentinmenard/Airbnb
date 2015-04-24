class FlatsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:index, :show]

  def index
    @flats = Flat.where(city: search_params[:city])
  end

  def show
    @flat = Flat.find(params[:id])
  end

  private

  def search_params
    params.permit(:city, :travellers, :starting_on, :ending_on )
  end

end
