class BookingsController < ApplicationController


  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = @flat.bookings.new(booking_params)
    if @booking.save
      @booking.update(user_id: current_user.id)
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:starting_on, :ending_on, :travellers)
  end

end