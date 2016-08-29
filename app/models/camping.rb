require 'elasticsearch/model'
class Camping < ApplicationRecord
  # ElasticSearch
include Elasticsearch::Model
include Elasticsearch::Model::Callbacks

belongs_to :ville
belongs_to :departement
belongs_to :region
belongs_to :proprietaire
belongs_to :caracteristiquetest
accepts_nested_attributes_for :caracteristiquetest
attr_accessor :piscine

resourcify
#Geocoding par adresse
def fulladress
    [adresse,code_postale,commune].to_a.compact.join(",")
end
geocoded_by :fulladress
after_validation :geocode

has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

#Permet de coller les labes pour avoir une adresse geocodable

#def as_indexed_json(options={})
  #  as_json(
  #    only: [:id, :name, :nomdep, :ville, :nomregion],
  #  )
  #end


end
# Index all article records from the DB to Elasticsearch
Camping.import(force: true)
