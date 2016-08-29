class CampingsController < ApplicationController
    before_action :set_camping, only: [:show, :edit, :update, :proprio_owner]
     before_action :authenticate_proprietaire!,except:[:index, :show]
     before_action :proprio_owner, only: [:edit, :update, :destroy]

  #Autoriser le proprietaire à modifier son camping s'il a le proprietaire_id
     def proprio_owner
      unless @camping.proprietaire_id == current_proprietaire.id
       flash[:notice] = "Vous n'êtes pas autorisé à modifier ce camping"
       redirect_to campings_path
      end
     end
  # GET /campings
  # GET /campings.json


  def index
#Permet de chercher les campings proches du camping courant
    if params[:search].present?
   @campings = Camping.near(params[:search], 10, :order => :distance).page(params[:page]).per(14)
    else
   @campings = Camping.all.page(params[:page]).per(14)
    end

#Systeme de Geocode avec marker permet d'encoder les adresse en GEOTAG
    @hash = Gmaps4rails.build_markers(@campings) do |camping, marker|
      marker.lat camping.latitude
      marker.lng camping.longitude
      marker.infowindow render_to_string(:partial => "/campings/infowindow", :locals => { :camping => camping})
      marker.picture ({
        "url" => "http://avantjetaisriche.com/map-pin.png",
        "width" =>  29,
        "height" => 32})
      end

  end
  # GET /campings/1
  # GET /campings/1.json

  def show
#Affiche le camping suivant l'ID
 @camping = Camping.find(params[:id])

#Systeme de Geotag avec map pour les campings
  @hash = Gmaps4rails.build_markers(@camping) do |camping, marker|
    marker.lat camping.latitude
    marker.lng camping.longitude
    marker.picture ({
     "url" => "http://avantjetaisriche.com/map-pin.png",
     "width" =>  29,
     "height" => 32})
   end
  end

  # GET /campings/new
  def new
    @camping = Camping.new
  end

  # GET /campings/1/edit
  def edit
  end

  def create
    @camping = Camping.new(camping_params)

    respond_to do |format|
      if @camping.save
        format.html { redirect_to @camping, notice: 'Camping was successfully created.' }
        format.json { render :show, status: :created, location: @camping }
      else
        format.html { render :new }
        format.json { render json: @camping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campings/1
  # PATCH/PUT /campings/1.json
  def update
    respond_to do |format|
      if @camping.update(camping_params)
        format.html { redirect_to @camping, notice: 'Camping was successfully updated.' }
        format.json { render :show, status: :ok, location: @camping }
      else
        format.html { render :edit }
        format.json { render json: @camping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campings/1
  # DELETE /campings/1.json
  def destroy
    @camping.destroy
    respond_to do |format|
      format.html { redirect_to campings_url, notice: 'Camping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camping
      @camping = Camping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camping_params
      params.require(:camping).permit(:name, :adresse, :code_postale, :commune, :courriel, :site_internet, :tel, :description, :nomdep, :nomregion, :numdep, :slug, :ville_id, :region_id, :departement_id, :latitude, :longitude, :etoile, :user_id, :image, caracteristiquetest_attributes: [:piscine, :barbecue])
    end
end
