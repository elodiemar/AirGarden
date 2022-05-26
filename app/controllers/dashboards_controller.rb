class DashboardsController < ApplicationController
  def dashboard
    @gardens = current_user.gardens
    @bookings = current_user.bookings
    authorize :dashboard, :dashboard?
    @review = Review.new
    # il va chercher dans le dashboard policy chercher la methode dashboard
  end
end
