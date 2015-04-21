class AddAttachmentPicture1ToFlats < ActiveRecord::Migration
  def self.up
    change_table :flats do |t|
      t.attachment :picture_1
    end
  end

  def self.down
    remove_attachment :flats, :picture_1
  end
end
