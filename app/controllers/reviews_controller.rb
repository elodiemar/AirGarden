class ReviewsController < ApplicationController
  before_action :set_garden, only: %i[ create]

  def create
    @review = Review.new(review_params)
    authorize @review
    @garden = Garden.find(params[:garden_id])
    @review.garden = @garden
    if @review.save!
      redirect_to garden_path(@garden)
    else
      render "gardens/show", status: :unprocessable_entity
    end
  end

  private

  def set_garden
    @garden = Garden.find(params[:garden_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
