class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    welcome_path # Redirect to the welcome page after registration
  end
end
