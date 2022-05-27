class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy, :edit, :update, :show]

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
    # create migration to had status on booking cf migration
    # booking status validated is false at creation
    @booking.status = false
    # save total price in booking
    duration = ((@booking.end_date - @booking.start_date) / 3_600).ceil
    @booking.total_price = @garden.price_per_hour * duration
    # create messages
      # create messages routes
      # create messages controller ... policy and authorize to be checked
      # create messages view
      # add message_path to navbar
      # in message for each unvalidated booking description add a row with booking description and a validate or refuse button
      # update booking status is 1 if validated 2 if refused
      # show the number of unvalidated bookings of the users garden on navbar
    # show booking status in user dashboard
    if @booking.save!
      redirect_to garden_booking_path(@garden, @booking), notice: "Demande de réservation transmise au propriétaire"
    else
      render "gardens/show"
      flash[:notice] = @booking.errors.full_messages.to_sentence
    end
  end

  def show
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    @booking.status = true
    if @booking.save!
      redirect_to messages_path, notice: "Réservation validée"
    else
      render "messages/messages"
      flash[:notice] = @booking.errors.full_messages.to_sentence
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path, notice: "Demande de réservation supprimée"
  end

  private

  def booking_params
    params.require(:booking).permit(:garden_id, :user_id, :start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
