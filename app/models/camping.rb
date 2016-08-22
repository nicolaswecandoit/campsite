require 'elasticsearch/model'
class Camping < ApplicationRecord
  # ElasticSearch
include Elasticsearch::Model
include Elasticsearch::Model::Callbacks

belongs_to :ville
belongs_to :departement
belongs_to :region
belongs_to :proprietaire
has_many :Caracteristiquetests
mount_uploader :image, ImageUploader

resourcify
#Geocoding par adresse
def fulladress
    [adresse,code_postale,commune].to_a.compact.join(",")
end
geocoded_by :fulladress
after_validation :geocode

#Permet de coller les labes pour avoir une adresse geocodable




end
# Index all article records from the DB to Elasticsearch
Camping.import(force: true)
