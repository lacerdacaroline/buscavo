class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: %i[show index]
  def show
    @admin = current_admin
  end

  def payments
    @admin = current_admin
  end

  def user
    @admin = current_admin
  end
end
