class DropConversationsTable < ActiveRecord::Migration[5.0]
   def up
    drop_table :conversations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
