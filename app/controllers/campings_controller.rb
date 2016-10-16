class CampingsController < ApplicationController
  before_action :set_camping, only: [:show, :edit, :update, :proprio_owner]
  before_action :authenticate_proprietaire!,except:[:homesearch, :index, :result, :show, :resultnohome]
  before_action :proprio_owner, only: [:edit, :update, :destroy]

  has_scope :nomdep

    #Autoriser le proprietaire à modifier son camping s'il a le proprietaire_id
  def proprio_owner
    unless @camping.proprietaire_id == current_proprietaire.id
      flash[:notice] = "Vous n'êtes pas autorisé à modifier ce camping"
      redirect_to campings_path
    end
  end


  #Permet de chercher les campings proches du camping courant
  def index
    if params[:search].present?
      @campings = Camping.near(params[:search], 10, :order => :distance).page(params[:page]).per(14)
    else
      @campings = Camping.all
      #Avec la Pagination
      #@campings = Camping.all.page(params[:page]).per(14)
    end

        #Systeme de Geocode avec marker permet d'encoder les adresse en GEOTAG
      @hash = Gmaps4rails.build_markers(@campings) do |camping, marker|
        marker.lat camping.latitude
        marker.lng camping.longitude
        marker.infowindow "
        <h3><a href='#{camping_path(camping.id)}' class='nice-link info-link'class='btn-primary' role='button'>#{camping.name}</a> </h3>
        <p>Camping <b>#{camping.etoile} à #{camping.commune}</b></p>
        "
        marker.picture ({
          "url" => "http://avantjetaisriche.com/map-pin.png",
          "width" =>  29,
          "height" => 32})
        end
    end

  #Affiche le camping suivant l'ID
    def show
      @camping = Camping.find(params[:id])
      
      if request.path != camping_path(@camping)
    redirect_to @camping, status: :moved_permanently
      end
      

      #Systeme de Geotag avec map pour les campings
      @hash = Gmaps4rails.build_markers(@camping) do |camping, marker|
        marker.lat camping.latitude
        marker.lng camping.longitude
        marker.picture ({
          "url" => "http://avantjetaisriche.com/map-pin.png",
          "width" =>  29,
          "height" => 32})
        marker.infowindow "
          <h3>#{camping.name}</h3>
          <p>#{camping.adresse}</p>
          <p>#{camping.code_postale}, #{camping.commune}</p>"
        end
    end

  # Nouveau camping
    def new
      @camping = Camping.new
    end

  # Edition du cammping
    def edit
  
    end
# Nouveau camping
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

    def update
      @camping = Camping.find(params[:id])
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

    def destroy
      @camping.destroy
      respond_to do |format|
        format.html { redirect_to campings_url, notice: 'Camping was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

#Systeme de recherche de la home
    def homesearch
    end

#Page de résultats
    def result
      if params[:query].blank?
        redirect_to action: :index and return
      else
        @campings = Camping.search(params[:query])
#lien sponsorisés
        if params[:query] == "aube"
          @pubtwo = Camping.find_by_id(1)

          elsif params[:query] == "vendée"
            @pub = Camping.find_by_id(5268)

              if params[:query] == "vendée"
                @pubtwo = Camping.find_by_id(5050)
              else
              
              end
              
          elsif params[:query] == "Vendée"
            @pub = Camping.find_by_id(5268)

              if params[:query] == "Vendée"
                @pubtwo = Camping.find_by_id(5050)
              else
              
              end
          
          elsif params[:query] == "Vendee"
            @pubtwo = Camping.find_by_id(5268)

          elsif params[:query] == "vendee"
            @pubtwo = Camping.find_by_id(5268)

          elsif params[:query] == "bretignolles"
            @pubtwo = Camping.find_by_id(5268)

          elsif params[:query] == "bretignolles-sur-mer"
            @pubtwo = Camping.find_by_id(5268)

          elsif params[:query] == "bretignolles sur mer"
            @pubtwo = Camping.find_by_id(5268)

          elsif params[:query] == "Bretignolles sur mer"
            @pubtwo = Camping.find_by_id(5268)

          elsif params[:query] == "alsace"
            @pubtwo = Camping.find_by_id(1)

          elsif params[:query] == "narbonne"
            @pubtwo = Camping.find_by_id(15)

          else
          end
      end

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
      
    
          

      def resultnohome
          if params[:query].blank?
            redirect_to action: :index and return
          else
          @campings = Camping.searchi(params[:query], params[:handicap], params[:animaux], params[:television], params[:plage], params[:etang], params[:lac])
            
            if params[:query] == "aube"
          @pubtwo = Camping.find_by_id(1)

          elsif params[:query] == "vendée"
            @pub = Camping.find_by_id(5268)

              if params[:query] == "vendée"
                @pubtwo = Camping.find_by_id(5050)
              else
              
              end
              
          elsif params[:query] == "Vendée"
            @pub = Camping.find_by_id(5268)

              if params[:query] == "Vendée"
                @pubtwo = Camping.find_by_id(5050)
              else
              
              end
            end
end

          @hash = Gmaps4rails.build_markers(@campings) do |camping, marker|
            marker.lat camping.latitude
            marker.lng camping.longitude
            marker.infowindow "
            <h3><a href='#{camping_path(camping.id)}' class='nice-link info-link'class='btn-primary' role='button'>#{camping.name}</a> </h3>
            <p>Camping <b>#{camping.etoile} à #{camping.commune}</b></p>
            <img src='http://cdn-jpg2.theactivetimes.net/sites/default/files/camping.jpg' width='265px' height='150px'>
            "
            marker.picture ({
              "url" => "http://avantjetaisriche.com/map-pin.png",
              "width" =>  29,
              "height" => 32})
            end
        end

    private
    # Use callbacks to share common setup or constraints between actions.
      def set_camping
        @camping = Camping.find(params[:id])
      end

    # Never trust parameters from the scary internet, only allow the white list through.
      def camping_params
        params.require(:camping).permit(:name, :proprietaire_id, :adresse, :code_postale, :commune, :courriel, :site_internet, :tel, :description, :nomdep, :nomregion, :numdep, :slug, :ville_id, :region_id, :departement_id, :latitude, :longitude, :etoile, :user_id, :image, :youtube_url, caracteristiquetests_attributes: [:id, :animaux, :handicap, :piscine, :barbecue, :television], situations_attributes: [:id, :plage, :distanceplage])
      end
end
