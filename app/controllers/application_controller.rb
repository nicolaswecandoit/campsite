#Autorisation à l'user de d'ajouter son nom prénom à l'inscription et de modifier son profil
class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #Lors de l'inscription
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :name])
    #Lors de la modification
    devise_parameter_sanitizer.permit(:account_update, keys: [:surname, :name, :gender, :telephone, :adresse, :cp, :ville, :fonction, :birthday])
  end
end
