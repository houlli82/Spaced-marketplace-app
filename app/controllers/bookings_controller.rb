class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking).includes(:space)
  end

  def new
    @space = Space.find(params[:space_id])
    @booking = Booking.new(space_id: @space.id)
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @space = Space.find(params[:space_id])
    @booking.space_id = @space.id
    authorize @booking

    if @booking.save
      redirect_to bookings_path
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

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :new
    end
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:space_id, :user_id, :to, :from, :status)
  end
end
