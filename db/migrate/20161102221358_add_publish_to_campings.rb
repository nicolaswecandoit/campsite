class AddPublishToCampings < ActiveRecord::Migration[5.0]
  def change
    add_column :campings, :publish, :boolean, :default => false
  end
end
