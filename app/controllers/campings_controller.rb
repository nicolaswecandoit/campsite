class CampingsController < ApplicationController
  before_action :authenticate_proprietaire!
  before_action :set_camping, only: [:show, :edit, :update, :destroy]

  # GET /campings
  # GET /campings.json


  def index

    if params[:search].present?
   @campings = Camping.near(params[:search], 10, :order => :distance)
 else
   @campings = Camping.all
 end
end
  # GET /campings/1
  # GET /campings/1.json
  def show
  end

  # GET /campings/new
  def new
    @camping = Camping.new
  end

  # GET /campings/1/edit
  def edit
  end

  # POST /campings
  # POST /campings.json
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
      params.require(:camping).permit(:name, :adresse, :code_postale, :commune, :courriel, :site_internet, :tel, :description, :nomdep, :nomregion, :numdep, :slug, :ville_id, :region_id, :departement_id, :latitude, :longitude, :etoile, :user_id)
    end
end
