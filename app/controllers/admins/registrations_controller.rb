class Admins::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters

  private

  def configure_permitted_parameters

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name,
                                                              :last_name,
                                                              :phone_number,
                                                              :credit_card_name,
                                                              :credit_card_number,
                                                              :credit_card_date,
                                                              :credit_card_security,
                                                              :user_first_name,
                                                              :user_last_name,
                                                              :user_phone_number,
                                                              :photo])
  end

  def payments
    render :payments
  end

  def user
    render :user
  end

  protected

  def after_update_path_for(resource)
    admins_path
  end

  def after_sign_up_path_for(resource)
    admins_path
  end

end
