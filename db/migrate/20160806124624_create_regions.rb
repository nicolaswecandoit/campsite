class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions do |t|
      t.text :descriptionregion
      t.text :nomderegion
      t.text :slug
      t.integer :region_id

      t.timestamps
    end
  end
end
