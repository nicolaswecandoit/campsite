class AddSurnameToProprietaire < ActiveRecord::Migration[5.0]
  def change
    add_column :proprietaires, :surname, :string
  end
end
