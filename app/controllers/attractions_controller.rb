class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @ride = Ride.new if !current_user.admin?
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    end
  end

  def edit

  end

  def update
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(
    :name,
    :tickets,
    :nausea_rating,
    :happiness_rating,
    :min_height
    )
  end
end
