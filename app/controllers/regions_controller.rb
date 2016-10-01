class RegionsController < ApplicationController
  before_action :set_region, only: [:show]
  before_action :authenticate_proprietaire!,except:[:index, :show]

  #Afficher toutes les régions
  def index
    @regions = Region.all
  end

  #Affiche la région sélectionnée
  def show
    @campings = Camping.all
      @departements = Departement.all
        @region = Region.find(params[:id])
          #Pour générer les URLs propres
            if request.path != region_path(@region)
              redirect_to @region, status: :moved_permanently
            end
      #Génère la carte avec l'infowindow
      @hash = Gmaps4rails.build_markers(@region.campings) do |camping, marker|
      marker.lat camping.latitude
      marker.lng camping.longitude
      marker.infowindow "
        <h3><a href='#{camping_path(camping.id)}' class='nice-link info-link'class='btn-primary' role='button'>#{camping.name}</a> </h3>
        <p>Camping <b>#{camping.etoile} à #{camping.commune}</b></p>"
      marker.picture ({
        "url" => "http://avantjetaisriche.com/map-pin.png",
        "width" =>  29,
        "height" => 32})
      end
  end

  def new
    @region = Region.new
  end

  def edit
  end

  def create
    @region = Region.new(region_params)

    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.json { render :show, status: :created, location: @region }
      else
        format.html { render :new }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @region.update(region_params)
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { render :show, status: :ok, location: @region }
      else
        format.html { render :edit }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

def destroy
    @region.destroy
    respond_to do |format|
      format.html { redirect_to regions_url, notice: 'Region was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(:descriptionregion, :nomderegion, :slug, :region_id)
    end
end
