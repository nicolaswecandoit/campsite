class AddEmplacementToCampings < ActiveRecord::Migration[5.0]
  def change
    add_column :campings, :emplacement, :integer
  end
end
