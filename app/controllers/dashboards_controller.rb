class DashboardsController < ApplicationController
  def dashboard
    @gardens = current_user.gardens
    @bookings = current_user.bookings
    @past_bookings = Booking.where("END_DATE < ? AND USER_ID = ?", Time.now, current_user.id)
    @next_bookings = Booking.where("END_DATE > ? AND USER_ID = ?", Time.now, current_user.id)
    authorize :dashboard, :dashboard?
    @review = Review.new
    authorize @review
    # il va chercher dans le dashboard policy chercher la methode dashboard
  end
end
