class ChangeDataTypeForPiscine < ActiveRecord::Migration[5.0]
  def change
    change_column :caracteristiquetests, :piscine, :string
    change_column :caracteristiquetests, :barbecue, :string
  end
end
