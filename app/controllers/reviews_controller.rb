class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def show
    @review = Review.all
  end

  def post
    @ride = Ride.find(params[:ride_id])
    @admin = current_admin
    @review = Review.new(review_params)
    @review.admin = @admin
    @review.ride = @ride
    @review.driver = @ride.driver
    @review.author = "admin"
    if @review.save
      redirect_to rides_path(@ride)
    else
      redirect_to driver_path, status: :unprocessable_entity
    end
  end

  def create
    @ride = Ride.find(params[:ride_id])
    @admin = Admin.find(@ride.user.admin_id)
    @review = Review.new(review_params)
    @review.admin = @admin
    @review.ride = @ride
    @review.driver = current_driver
    @review.author = "driver"
     if @review.save
      redirect_to rides_path(@ride)
    else
      redirect_to driver_path, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:stars, :content, :admin_id, :driver_id, :ride_id)
  end
end
