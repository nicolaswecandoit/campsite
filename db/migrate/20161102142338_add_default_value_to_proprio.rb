class AddDefaultValueToProprio < ActiveRecord::Migration[5.0]
  def up
  change_column :users, :proprio, :boolean, :default => false
end

def down
  change_column :users, :proprio, :boolean, :default => nil
end

end