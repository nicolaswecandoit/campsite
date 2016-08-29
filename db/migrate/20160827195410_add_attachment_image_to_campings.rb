class AddAttachmentImageToCampings < ActiveRecord::Migration
  def self.up
    change_table :campings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :campings, :image
  end
end
