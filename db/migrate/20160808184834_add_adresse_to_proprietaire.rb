class AddAdresseToProprietaire < ActiveRecord::Migration[5.0]
  def change
    add_column :proprietaires, :adresse, :string
  end
end
