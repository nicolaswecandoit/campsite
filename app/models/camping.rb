class Camping < ApplicationRecord
belongs_to :ville
belongs_to :departement
belongs_to :region
belongs_to :proprietaire
mount_uploader :image, ImageUploader

resourcify
#Geocoding par adresse
geocoded_by :fulladress
after_validation :geocode

#Permet de coller les labes pour avoir une adresse geocodable
def fulladress
    [adresse,code_postale,commune].to_a.compact.join(",")
end
end
