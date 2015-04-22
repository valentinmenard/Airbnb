module Account
  class FlatsController < ApplicationController
    # layout 'account'

    before_action :authenticate_user!

    def index
      @flats = Flat.all
      # if @flats.where(:city)
    end

    def show
      @flat = Flat.find(params[:id])
    end

    def new
      @flat = Flat.new
    end

    def create
      @flat = Flat.new(flat_params)

      if @flat.save
        redirect_to account_flat_path(@flat)
      else
        render :new
      end
    end

    def edit
      @flat = Flat.find(params[:id])
    end

    def update
      @flat = Flat.find(params[:id])
      @flat.update(flat_params)
      redirect_to account_flat_path(@flat)
    end

    private

    def flat_params
      params.require(:flat).permit(:title, :description, :price, :city, :capacity, :availability, :picture_1, :picture_2, :picture_3)
    end
  end
end