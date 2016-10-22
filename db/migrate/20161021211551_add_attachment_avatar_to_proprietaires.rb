class AddAttachmentAvatarToProprietaires < ActiveRecord::Migration
  def self.up
    change_table :proprietaires do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :proprietaires, :avatar
  end
end
