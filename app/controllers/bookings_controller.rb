class BookingsController < ApplicationController
  before_action :booking, only: :destroy

  def new
    @booking = Booking.new
  end

  def create
    @garden.user = current_user
    @booking = Booking.new(booking_params)
    if @booking.save!
      redirect_to dashboard_path
    else
      flash[:notice] = @booking.errors.full_messages.to_sentence
    end
  end

  def show
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:garden_id, :user_id, :start_date, :end_date)
  end

  def set_booking
    @bookmark = Booking.find(params[:id])
  end

end
