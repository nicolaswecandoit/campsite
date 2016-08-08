class AddCpToProprietaire < ActiveRecord::Migration[5.0]
  def change
    add_column :proprietaires, :cp, :string
  end
end
