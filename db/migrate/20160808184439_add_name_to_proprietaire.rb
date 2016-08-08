class AddNameToProprietaire < ActiveRecord::Migration[5.0]
  def change
    add_column :proprietaires, :name, :string
  end
end
