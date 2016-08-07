class Ville < ApplicationRecord
  has_many :campings
  belongs_to :departement
  belongs_to :region

  def to_s
    nomcommune
  end


end
