class CreateCampings < ActiveRecord::Migration[5.0]
  def change
    create_table :campings do |t|
      t.string :name
      t.string :adresse
      t.string :code_postale
      t.string :commune
      t.string :courriel
      t.string :site_internet
      t.string :tel
      t.text :description
      t.string :nomdep
      t.string :nomregion
      t.string :numdep
      t.string :slug
      t.integer :ville_id
      t.integer :region_id
      t.integer :departement_id
      t.float :latitude
      t.float :longitude
      t.string :etoile
      t.integer :user_id

      t.timestamps
    end
  end
end
