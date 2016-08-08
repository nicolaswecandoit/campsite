class AddFonctionToProprietaire < ActiveRecord::Migration[5.0]
  def change
    add_column :proprietaires, :fonction, :string
  end
end
