class AddHandicapToCaracteristiquetest < ActiveRecord::Migration[5.0]
  def change
    add_column :caracteristiquetests, :handicap, :string
  end
end
