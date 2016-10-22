class AddDailymotionToCampings < ActiveRecord::Migration[5.0]
  def change
    add_column :campings, :dailymotion, :string
  end
end
