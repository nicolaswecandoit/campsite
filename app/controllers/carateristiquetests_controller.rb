class CaracteristiquetestsController < ApplicationController
  def camping_params
    params.require(:caracteristiquetests).permit(:piscine, :barbecue, :animaux, :handicap)
  end
end
