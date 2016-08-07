class RemoveUserIdFromCamping < ActiveRecord::Migration[5.0]
  def change
    remove_column :campings, :user_id, :integer
  end
end
