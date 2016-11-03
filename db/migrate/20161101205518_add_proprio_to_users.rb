class AddProprioToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :proprio, :boolean
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :genre, :string
    add_column :users, :adresse, :string
    add_column :users, :ville, :string
    add_column :users, :cp, :integer
    add_column :users, :telephone, :integer
    add_column :users, :metier, :string
    add_column :users, :naissance, :date
  end
end
