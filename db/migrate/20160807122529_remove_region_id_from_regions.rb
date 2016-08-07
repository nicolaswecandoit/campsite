class RemoveRegionIdFromRegions < ActiveRecord::Migration[5.0]
  def change
    remove_column :regions, :region_id, :integer
  end
end
