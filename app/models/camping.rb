class Camping < ApplicationRecord
#Liste des associations
  belongs_to :ville
  belongs_to :departement
  belongs_to :region
  belongs_to :proprietaire
  has_many :caracteristiquetests, :foreign_key => :camping_id
  has_many :situations, :foreign_key => :camping_id

  accepts_nested_attributes_for :caracteristiquetests

#Permet de générer les URL SEO
  def to_param
      "#{id} #{name}".parameterize
    end
      extend FriendlyId
        friendly_id :name

#Permet de générer la recherche avec filtres
  def self.searchi(query, handicap, animaux, television, plage, etang, lac)
    return scoped unless query.present?
         result = left_outer_joins(:caracteristiquetests, :situations).where('nomdep LIKE ? OR name LIKE ? OR nomregion LIKE ?', "%#{query}%", "%#{query}%", "%#{query}%")
         result = result.where('handicap LIKE ?', "%#{handicap}%") if handicap
         result = result.where('animaux LIKE ?', "%#{animaux}%") if animaux
         result = result.where('television LIKE ?', "%#{television}%") if television
         result = result.where('plage LIKE ?', "%#{plage}%") if plage
         result = result.where('etang LIKE ?', "%#{etang}%") if etang
         result = result.where('lac LIKE ?', "%#{lac}%") if lac
      return result
  end

#Recherche de base pour la home
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
  #Generer une adresse complete pour le géocoding
  def fulladress
    [adresse,code_postale,commune].to_a.compact.join(",")
  end

end
