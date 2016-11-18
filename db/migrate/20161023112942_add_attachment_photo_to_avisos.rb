class AddAttachmentPhotoToAvisos < ActiveRecord::Migration
  def self.up
    change_table :avisos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :avisos, :photo
  end
end
