class CreateSituations < ActiveRecord::Migration[5.0]
  def change
    create_table :situations do |t|
      t.string :plage
      t.float :distanceplage
      t.string :etang
      t.float :distanceetang
      t.string :lac
      t.float :distancelac
      t.string :riviere
      t.float :distanceriviere
      t.string :baseloisir
      t.float :distancebaseloisir
      t.string :foret
      t.float :distanceforet
      t.string :parcnaturel
      t.float :distanceparcnaturel
      t.string :montagne
      t.float :distancemontagne
      t.string :sporthiver
      t.float :distancesporthiver
      t.integer :camping_id

      t.timestamps
    end
  end
end
