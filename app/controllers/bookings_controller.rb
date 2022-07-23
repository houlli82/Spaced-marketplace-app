class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    # @bookings = Booking.where user = current_user
    # if current_user.id == params[:id],
      # redirect_to space_bookings_path
    # end
  end

  def new
    @booking = Booking.new
  end

  def create
    @space = Space.find(params[:space_id])
    @booking = @list.bookings.new(bookings_params)
    if @booking.save
      redirect_to @booking.space
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @space = Space.find(params[:space_id])
    @booking = @space.bookings.destroy
    redirect_to @bookings.list
  end

  private

  def booking_params
    params.require(:booking).permit(:space_id, :user_id)
  end
end
