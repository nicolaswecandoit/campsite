class AddTelephoneToProprietaire < ActiveRecord::Migration[5.0]
  def change
    add_column :proprietaires, :telephone, :integer
  end
end
