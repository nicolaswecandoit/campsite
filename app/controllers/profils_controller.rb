class ProfilsController < ApplicationController
  def index
    #@camping = Proprietaire.find(params[:id])
    #@user = Camping.find(params[:proprietaire_id])
    #@campings = @user.camping
    @posts = current_user.camping
  end
end
