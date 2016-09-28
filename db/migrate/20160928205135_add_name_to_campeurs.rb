class AddNameToCampeurs < ActiveRecord::Migration[5.0]
  def change
    add_column :campeurs, :name, :string
    add_column :campeurs, :gender, :string
    add_column :campeurs, :adresse, :string
    add_column :campeurs, :ville, :string
    add_column :campeurs, :cp, :string
    add_column :campeurs, :surname, :string
    add_column :campeurs, :telephone, :integer
    add_column :campeurs, :birthday, :date
    add_column :campeurs, :description, :text
    add_column :campeurs, :fonction, :string
    add_column :campeurs, :verified, :boolean
  end
end
