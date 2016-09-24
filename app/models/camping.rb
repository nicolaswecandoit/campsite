require 'elasticsearch/model'
class Camping < ApplicationRecord
  scope :nomdep, -> (nomdep) { where nomdep: "aube" }
# ElasticSearch
#include Elasticsearch::Model
#include Elasticsearch::Model::Callbacks
#searchkick

belongs_to :ville
belongs_to :departement
belongs_to :region
belongs_to :proprietaire
belongs_to :caracteristiquetest
accepts_nested_attributes_for :caracteristiquetest
attr_accessor :piscine

#mapping do
#   indexes :name, boost: 8
#   indexes :adresse
#   indexes :commune, boost: 10
#   indexes :description
#   indexes :nomdep, boost: 10
#   indexes :nomregion, boost: 10
#   indexes :ville_id
#   indexes :region_id
#   indexes :departement_id
#   indexes :latitude
#   indexes :longitude
#   indexes :etoile
#   indexes :user_id
#   indexes :caracteristiquetest_id
   #On implante les données du modèle supplémentaire
#    indexes :caracteristiquetests, type: 'nested' do
#      indexes :id,   type: 'integer'
#      indexes :piscine, type: 'string'
#      indexes :barbecue, type: 'string'
#      indexes :camping_id, type: 'integer'
#    end
# end

# def self.search(commune,nomdep)
#    where("commune like ?", "%#{commune}%").where("nomdep like ?", "%#{nomdep}%")
#    def self.search(commune,nomdep)
#  where("commune LIKE ? OR name LIKE ? ", "%#{commune}%", "%#{nomdep}%")
# end

def self.searchi(nomdep)
   return scoped unless nomdep.present?
  where(['nomdep LIKE ?', "%#{nomdep}%"])
end

def self.search(piscine, barbecue, nomdep)
   return scoped unless piscine.present? || barbecue.present? || nomdep.present?
  where(['piscine LIKE ? AND barbecue LIKE ? AND nomdep LIKE ?', "%#{piscine}%", "%#{barbecue}%", "%#{nomdep}%"])
end
#end

  def as_indexed_json(options = {})
    self.as_json(only: [:name, :adresse, :code_postale, :commune, :description, :nomdep, :nomregion, :latitude, :longitude, :etoile, :caracteristiquetest_id],
    include: {caracteristiquetest: {only: [:id, :piscine, :barbecue, :camping_id]}})
  end

# Marche avec elasticsearch classique
class << self
    def custom_search(query)
      __elasticsearch__.search(query: multi_match_query(query))
    end

    def multi_match_query(query)
      {
        multi_match: {
          query: query,
          type: "best_fields", # possible values "most_fields", "phrase", "phrase_prefix", "cross_fields"
          fields: ["name^6", "nomdep^10", "commune^7", "nomregion^8"],
          operator: "and"
        }
      }
    end
# def aggregations
#  {
#    aggs: {
#          barbecue: {
#          terms: {
#          field: "caracteristiquetest.barbecue"
#             }
#          }
#        }
#  end
#  }
end


resourcify
#Geocoding par adresse
geocoded_by :fulladress
after_validation :geocode

  def fulladress
    [adresse,code_postale,commune].to_a.compact.join(",")
  end

  end
