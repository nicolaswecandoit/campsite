class DepartementsController < ApplicationController
  before_action :set_departement, only: [:show]
  before_action :authenticate_proprietaire!,except:[:index, :show]


  # GET /departements
  # GET /departements.json
  def index
    @departements = Departement.all
  end

  # GET /departements/1
  # GET /departements/1.json
  def show
    @ville = Ville.all
    @camping = Camping.all
    @departement = Departement.find(params[:id])
    if request.path != departement_path(@departement)
      redirect_to @departement, status: :moved_permanently
    end

    @hash = Gmaps4rails.build_markers(@departement.campings) do |camping, marker|
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

  # GET /departements/new
  def new
    @departement = Departement.new
  end

  # GET /departements/1/edit
  def edit
  end

  # POST /departements
  # POST /departements.json
  def create
    @departement = Departement.new(departement_params)

    respond_to do |format|
      if @departement.save
        format.html { redirect_to @departement, notice: 'Departement was successfully created.' }
        format.json { render :show, status: :created, location: @departement }
      else
        format.html { render :new }
        format.json { render json: @departement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departements/1
  # PATCH/PUT /departements/1.json
  def update
    respond_to do |format|
      if @departement.update(departement_params)
        format.html { redirect_to @departement, notice: 'Departement was successfully updated.' }
        format.json { render :show, status: :ok, location: @departement }
      else
        format.html { render :edit }
        format.json { render json: @departement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departements/1
  # DELETE /departements/1.json
  def destroy
    @departement.destroy
    respond_to do |format|
      format.html { redirect_to departements_url, notice: 'Departement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departement
      @departement = Departement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def departement_params
      params.require(:departement).permit(:description, :nomdep, :departement_id, :slug, :region_id)
    end
end
