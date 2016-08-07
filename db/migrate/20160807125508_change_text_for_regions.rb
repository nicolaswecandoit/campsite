class ChangeTextForRegions < ActiveRecord::Migration[5.0]
  def change
      change_column :regions, :nomderegion, :string
      change_column :regions, :slug, :string
    end
end
