class CreateCampingPictures < ActiveRecord::Migration[5.0]
  def change
    create_table :camping_pictures do |t|

      t.timestamps
    end
  end
end
