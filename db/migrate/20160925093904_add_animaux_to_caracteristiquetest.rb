class AddAnimauxToCaracteristiquetest < ActiveRecord::Migration[5.0]
  def change
    add_column :caracteristiquetests, :animaux, :string
    add_column :caracteristiquetests, :television, :string
  end
end
