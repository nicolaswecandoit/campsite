class AddVerifiedToProprietaire < ActiveRecord::Migration[5.0]
  def change
    add_column :proprietaires, :verified, :boolean
  end
end
