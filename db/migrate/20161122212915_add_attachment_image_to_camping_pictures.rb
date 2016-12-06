class AddAttachmentImageToCampingPictures < ActiveRecord::Migration
  def self.up
    change_table :camping_pictures do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :camping_pictures, :image
  end
end
