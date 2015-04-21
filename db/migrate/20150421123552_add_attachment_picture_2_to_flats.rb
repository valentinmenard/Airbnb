class AddAttachmentPicture2ToFlats < ActiveRecord::Migration
  def self.up
    change_table :flats do |t|
      t.attachment :picture_2
    end
  end

  def self.down
    remove_attachment :flats, :picture_2
  end
end
