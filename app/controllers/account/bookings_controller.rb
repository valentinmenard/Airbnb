module Account
  class BookingsController < ApplicationController
    # layout 'account'

    before_action :authenticate_user!

    def index_owner
      @bookings = current_user.flats.bookings
    end

    def index_renter
      @bookings = current_user.bookings
    end


    # def show
    #   @flat = current_user.flats.find(params[:id])
    # end

    # def new
    #   @flat = current_user.flats.new
    # end

    # def create
    #   @flat = current_user.flats.new(flat_params)

    #   if @flat.save
    #     redirect_to account_flat_path(@flat)
    #   else
    #     render :new
    #   end
    # end

    # def edit
    #   @flat = current_user.flats.find(params[:id])
    # end

    # def update
    #   @flat.update(flat_params)
    #   redirect_to account_flat_path(@flat)
    # end

    # private

    # def flat_params
    #   params.require(:flat).permit(:title, :description, :price, :city, :capacity, :availability, :picture_1, :picture_2, :picture_3)
    # end
  end
end