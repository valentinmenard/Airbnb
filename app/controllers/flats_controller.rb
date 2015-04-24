class FlatsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:index, :show]

  def index
    @flats = Flat.all
    # Let's DYNAMICALLY build the markers for the view.
      @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
        marker.lat flat.latitude
        marker.lng flat.longitude
      end
  end

  def show
    @flat = Flat.find(params[:id])
    @flat_coordinates = { lat: @flat.latitude, lng: @flat.longitude }
  end

end
