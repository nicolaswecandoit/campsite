class Camping < ApplicationRecord

belongs_to :ville
belongs_to :departement
belongs_to :region
belongs_to :proprietaire
has_many :caracteristiquetests, :foreign_key => :camping_id
has_many :situations, :foreign_key => :camping_id

accepts_nested_attributes_for :caracteristiquetests


def self.searchi(query, handicap, animaux, television, plage, etang, lac)
   return scoped unless query.present?
   left_outer_joins(:caracteristiquetests, :situations).where(['(nomdep LIKE ? OR name LIKE ? OR nomregion LIKE ?) AND (handicap LIKE ? AND animaux LIKE ? AND television LIKE ? AND plage LIKE ? AND etang LIKE ? AND lac LIKE ?)', "%#{query}%", "%#{query}%", "%#{query}%", "%#{handicap}%", "%#{animaux}%", "%#{television}%", "%#{plage}%", "%#{etang}%", "%#{lac}%"])
end

def self.search(query)
   return scoped unless query.present?
   where(['nomdep LIKE ? OR name LIKE ? OR nomregion LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%"])
end


  def as_indexed_json(options = {})
    self.as_json(only: [:name, :adresse, :code_postale, :commune, :description, :nomdep, :nomregion, :latitude, :longitude, :etoile, :caracteristiquetest_id],
    include: {caracteristiquetest: {only: [:id, :piscine, :barbecue, :camping_id, :handicap, :animaux]}})
  end


resourcify
#Geocoding par adresse
geocoded_by :fulladress
after_validation :geocode

  def fulladress
    [adresse,code_postale,commune].to_a.compact.join(",")
  end

  end
