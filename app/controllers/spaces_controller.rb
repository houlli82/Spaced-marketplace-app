class SpacesController < ApplicationController
  def index
    #@spaces = Space.all
    @spaces = policy_scope(Space)
  end

  def show
    @space = Space.find(params[:id])
    @booking = Booking.new(user_id: current_user.id, space_id: @space.id)
    authorize @space
  end

  # def new
  #   @space = Space.new
  # end

  # def create
  #   @space = Space.new(space_params)
  #   if @space.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  private

  def space_params
    params.require(:space).permit(:location, :capacity, :fee, :size)
  end
end
