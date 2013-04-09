class AddAttachmentPictureToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.has_attached_file :picture
    end
  end

  def self.down
    drop_attached_file :photos, :picture
  end
end
