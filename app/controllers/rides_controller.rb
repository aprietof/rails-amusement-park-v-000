class RidesController < ApplicationController
  def create
    @ride = Ride.new(ride_params)
    @attraction = Attraction.find(params[:ride][:attraction_id])
    @message = @ride.take_ride
    redirect_to user_path(@ride.user.id), alert: @message
  end

  private
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
