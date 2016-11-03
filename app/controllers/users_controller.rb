class UsersController < ApplicationController
  def index
    #@camping = Proprietaire.find(params[:id])
    #@user = Camping.find(params[:proprietaire_id])
    #@campings = @user.camping
    #@posts = current_user.camping
  @campings = Camping.where(:user_id => current_user.id)
      @campingsemail = Camping.where(:courriel => current_user.email)
  end

def moncamping
      @campings = Camping.where(:user_id => current_user.id)
      @campingsemail = Camping.where(:courriel => current_user.email)
  end

end
