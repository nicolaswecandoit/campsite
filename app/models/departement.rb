class Departement < ApplicationRecord
  has_many :villes
  has_many :campings
  belongs_to :region


  def to_s
    nomdep
  end

end
