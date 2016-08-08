class AddGenderToProprietaire < ActiveRecord::Migration[5.0]
  def change
    add_column :proprietaires, :gender, :string
  end
end
