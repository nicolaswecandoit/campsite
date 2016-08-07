class AddImageToCampings < ActiveRecord::Migration[5.0]
  def change
    add_column :campings, :image, :string
  end
end
