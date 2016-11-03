class AddUseridToCampings < ActiveRecord::Migration[5.0]
  def change
    add_column :campings, :user_id, :integer
  end
end
