class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy, :show]

  def new
    @booking = Booking.new

  end

  def create
    @garden = Garden.find(params[:garden_id])
    authorize @garden
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.user = current_user
    @booking.garden = @garden
    if @booking.save!
      redirect_to garden_booking_path(@garden, @booking)
    else
      render "gardens/show"
      flash[:notice] = @booking.errors.full_messages.to_sentence

    end
  end

  def show
    authorize @booking
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path, notice: "La demande d'annulation à bien été transmise au propriétaire"
  end

  private

  def booking_params
    params.require(:booking).permit(:garden_id, :user_id, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
