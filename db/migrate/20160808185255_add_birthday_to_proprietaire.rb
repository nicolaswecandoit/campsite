class AddBirthdayToProprietaire < ActiveRecord::Migration[5.0]
  def change
    add_column :proprietaires, :birthday, :date
  end
end
