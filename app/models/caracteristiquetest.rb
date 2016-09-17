class Caracteristiquetest < ApplicationRecord
  has_one :camping
  accepts_nested_attributes_for :camping
    scope :piscine, -> { where(piscine: 'oui') }
end
