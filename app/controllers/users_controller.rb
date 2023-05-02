class UsersController < ApplicationController
  def home
    if params[:refeer].present?
      @admin = Admin.find(params[:refeer])
      @ride = Ride.new
      @user = User.find_by(admin_id: params[:refeer])
    else
      redirect_to root_path
      flash[:notice] = "Por favor, utilize um código de referência p/ acessar esta página!"
    end
  end

  def new
    @user = User.new
  end

  def edit
    @admin = current_admin
    @user = User.find_by(admin_id: @admin.id)
  end

  def update
    @admin = current_admin
    @user = User.find_by(admin_id: @admin.id)
    if @user.update(user_params)
      redirect_to @admin, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @user = User.new(user_params)
    @user.admin = current_admin
    respond_to do |format|
      if @user.save
        format.html { redirect_to admins_url, notice: "user was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find_by(params[:admin_id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number)
  end
end
