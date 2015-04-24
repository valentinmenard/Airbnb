class FlatsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:index, :show]

  def index
    @flats = Flat.where(city: search_params[:city])
      @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
        marker.lat flat.latitude
        marker.lng flat.longitude
      end

  end

  def show
    @flat = Flat.find(params[:id])
    @flat_coordinates = { lat: @flat.latitude, lng: @flat.longitude }
  end

  private

  def search_params
    params.permit(:city, :travellers, :starting_on, :ending_on )
  end

end
