class ProprietairesController < ApplicationController
  def index
    #@camping = Proprietaire.find(params[:id])
    #@user = Camping.find(params[:proprietaire_id])
    #@campings = @user.camping
    #@posts = current_user.camping
    @campings = Camping.where(:proprietaire_id => current_proprietaire.id)
  end
end
