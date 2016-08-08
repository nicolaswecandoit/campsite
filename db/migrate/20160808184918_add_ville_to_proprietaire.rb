class AddVilleToProprietaire < ActiveRecord::Migration[5.0]
  def change
    add_column :proprietaires, :ville, :string
  end
end
