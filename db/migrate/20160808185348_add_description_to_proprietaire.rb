class AddDescriptionToProprietaire < ActiveRecord::Migration[5.0]
  def change
    add_column :proprietaires, :description, :text
  end
end
