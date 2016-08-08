class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:surname, :name, :gender, :telephone, :adresse, :cp, :ville, :fonction, :birthday])
  end
end
