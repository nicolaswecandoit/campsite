class AddAdressecompleteToCampings < ActiveRecord::Migration[5.0]
  def change
    add_column :campings, :adressecomplete, :string
  end
end
