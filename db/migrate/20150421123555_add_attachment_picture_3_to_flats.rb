class AddAttachmentPicture3ToFlats < ActiveRecord::Migration
  def self.up
    change_table :flats do |t|
      t.attachment :picture_3
    end
  end

  def self.down
    remove_attachment :flats, :picture_3
  end
end
