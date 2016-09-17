class AddBarbecueToCampings < ActiveRecord::Migration[5.0]
  def change
    add_column :campings, :barbecue, :string
  end
end
