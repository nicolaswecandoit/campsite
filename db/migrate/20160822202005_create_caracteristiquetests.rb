class CreateCaracteristiquetests < ActiveRecord::Migration[5.0]
  def change
    create_table :caracteristiquetests do |t|
      t.boolean :piscine
      t.boolean :barbecue
      t.integer :camping_id

      t.timestamps
    end
  end
end
