class AddProprietaireidToCampings < ActiveRecord::Migration[5.0]
  def change
    add_column :campings, :proprietaire_id, :integer
  end
end
