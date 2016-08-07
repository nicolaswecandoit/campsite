class CreateDepartements < ActiveRecord::Migration[5.0]
  def change
    create_table :departements do |t|
      t.text :description
      t.string :nomdep
      t.integer :departement_id
      t.string :slug
      t.integer :region_id

      t.timestamps
    end
  end
end
