class AddCaracteristiquetestIdColumnToCampings < ActiveRecord::Migration[5.0]
  def change
    add_column :campings, :caracteristiquetest_id, :integer
  end
end
