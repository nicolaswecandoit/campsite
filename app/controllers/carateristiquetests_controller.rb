class CaracteristiquetestsController < ApplicationController
  def camping_params
    params.require(:caracteristiquetest).permit(:piscine)
  end
end
