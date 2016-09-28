class Caracteristiquetest < ApplicationRecord
  belongs_to :camping
  accepts_nested_attributes_for :camping
end
