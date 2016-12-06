class AddCampingIdToCampingPicture < ActiveRecord::Migration[5.0]
  def change
    add_column :camping_pictures, :camping_id, :integer
  end
end
