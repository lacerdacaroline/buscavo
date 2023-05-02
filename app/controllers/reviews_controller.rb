class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @ride = Ride.find(params[:ride_id])
    @review.ride = @review
    authorize @review
    if @review.save
      redirect_to super_power_path(@super_power)
    else
      redirect_to super_power_path(@super_power), status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:stars, :content, :user_id, :admin_id, :driver_id, :ride_id)
  end
end
