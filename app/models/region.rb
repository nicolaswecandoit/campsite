class Region < ApplicationRecord
  has_many :villes
  has_many :departements
  has_many :campings

  def to_s
    nomderegion
  end
  #Génère des URLS propres
  def to_param
      "#{id} #{nomderegion}".parameterize
    end


end
