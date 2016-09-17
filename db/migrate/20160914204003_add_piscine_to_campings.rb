class AddPiscineToCampings < ActiveRecord::Migration[5.0]
  def change
    add_column :campings, :piscine, :string
  end
end
