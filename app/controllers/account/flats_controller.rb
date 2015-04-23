module Account
  class FlatsController < ApplicationController

    before_action :authenticate_user!

    def index
      @flats = current_user.flats

      # if @flats.where(:city)
    end

    def edit
      @flat = Flat.find(params[:id])
    end

    def update
      @flat = Flat.find(params[:id])
      @flat.update(flat_params)
      redirect_to account_flats_path
    end

    def new
      @flat = Flat.new
    end

    def create
      @flat = current_user.flats.new(flat_params)
      if @flat.save
        redirect_to flat_path(@flat)
      else
        render :new
      end
    end

    private

    def flat_params
      params.require(:flat).permit(:title, :description, :price, :city, :capacity, :availability, :picture_1, :picture_2, :picture_3)
    end
  end
end