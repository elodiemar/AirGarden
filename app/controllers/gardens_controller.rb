class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  def index
    @gardens = policy_scope(Garden)
    if params[:query]
      @gardens = @gardens.search_by_title_and_town(params[:query])
    end

    @markers = @gardens.geocoded.map do |garden|
      {
        lat: garden.latitude,
        lng: garden.longitude
      }
    end
  end

  def show
    authorize @garden
    @booking = Booking.new
  end

  def edit
    authorize @garden
  end

  def update
    authorize @garden
    @garden.update(gardens_params)
    redirect_to garden_path(@garden)
  end

  def new
    @garden = Garden.new
    authorize @garden
  end

  def create
    @garden = Garden.new(gardens_params)
    @garden.user = current_user
    authorize @garden
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @garden
    @garden.destroy
    redirect_to root_path
  end

  private

  def gardens_params
    params.require(:garden).permit(:title, :size, :capacity, :description, :price_per_hour, :address, :town, photos: [])
    # :address,
  end

  def set_garden
    @garden = Garden.find(params[:id])
  end
end
