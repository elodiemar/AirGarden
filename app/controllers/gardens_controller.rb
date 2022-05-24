class GardensController < ApplicationController
  before_action :set_gardens, only: [:show, :edit, :update, :destroy]

  def index
    @gardens = Garden.all
  end

  def show
  end

  def edit
  end

  def update
    @garden.update(gardens_params)
    redirect_to garden_path(@garden)
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(gardens_params)
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @garden.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def gardens_params
    params.require(:garden).permit(:title, :size, :capacity, :description, :price_per_hour)
  end

  def set_gardens
    @garden = Garden.find(params[:id])
  end
end
