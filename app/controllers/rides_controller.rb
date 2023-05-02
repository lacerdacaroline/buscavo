class RidesController < ApplicationController
  protect_from_forgery with: :null_session

  def new
    @admin = Admin.find(params[:refeer])
    @user = @admin.user.first
    @ride = Ride.find_or_create_by(user_phone_number: @user.phone_number, user: @user, driver: Driver.first)
  end

  def services
    @ride = Ride.last

    respond_to do |format|
      format.html { }
      format.json { }
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:start_address, :end_address, :price, :user_id, :driver_id, :user_phone_number)
  end
end
