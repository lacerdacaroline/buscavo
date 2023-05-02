class NotifiesController < ApplicationController
  include CableReady::Broadcaster
  protect_from_forgery with: :null_session

  def create
    @ride = Ride.find(params[:ride_id])
    @user = User.find_by(phone_number: params[:phone_number])
    @notify = Notify.new
    @notify.content = "Is requesting a ride!"
    @notify.ride_id = @ride.id
    @notify.user = @user
    if @notify.save
      cable_ready[RidesChannel].broadcast_to @ride
      head :ok
      respond_to do |format|
        format.html { redirect_to ride_url(@ride), notice: "ride was successfully created." }
        format.json { }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @notify.errors, status: :unprocessable_entity }
      end
    end
  end

end
