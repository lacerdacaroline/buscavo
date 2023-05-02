class DriversController < ApplicationController
  before_action :authenticate_driver!, only: %i[index show calls]

  def index
    @driver = current_driver
  end

  # desativar essa show?
  def show
    @driver = current_driver
    @rides = Ride.all
  end

  def calls
    @notifies = Notify.all
    @notify = Notify.last
    @ride = Ride.last
    @driver = current_driver
    @user = User.find(@ride.user_id)
  end
end
