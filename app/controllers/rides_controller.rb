class RidesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate_admin!, only: :index

  def new
    @ride = Ride.find(params[:ride])
    @user = @ride.user
    @admin = @user.admin
  end

  def index
    @rides= Ride.where(user_id: current_admin.user.id)
  end

def old_ride_drive
  @rides= Ride.where(driver_id: current_driver.id)
end

  def show
    @ride = Ride.find(params[:id])
    @review = Review.new
  end

  def services
    @ride = Ride.last

    respond_to do |format|
      format.html { }
      format.json { }
    end
  end

  def create
    @user = User.find(ride_params[:user_id])
    @ride = Ride.find_or_create_by(user_phone_number: @user.phone_number, user: @user, driver: Driver.first, latitude: ride_params[:latitude] , longitude: ride_params[:longitude])

    respond_to do |format|
      format.html { redirect_to new_ride_path(ride: @ride) }
      format.json { render :show, status: :created, location: @ride }
    end
  end

  def run
    @ride = Ride.find(params[:id])
    @markers = [{
        lat: @ride.latitude,
        lng: @ride.longitude
    }]
  end

  private

  def ride_params
    params.require(:ride).permit(:start_address, :end_address, :price, :user_id, :driver_id, :user_phone_number, :latitude, :longitude)
  end
end
