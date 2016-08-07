class Region < ApplicationRecord
  has_many :villes
  has_many :departements
  has_many :campings

  def to_s
    nomderegion
  end


end
