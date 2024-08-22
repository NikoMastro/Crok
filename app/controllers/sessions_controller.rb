class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    home_path # Redirect to the home page after login
  end
end
