class CreatePostAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :post_attachments do |t|
      t.integer :camping_id
      t.string :gallerie

      t.timestamps
    end
  end
end
