class Flat < ActiveRecord::Base

  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_attached_file :picture_1,
    styles: { medium: "900x900>", thumb: "300x300>" }
  has_attached_file :picture_2,
    styles: { medium: "900x900>", thumb: "300x300>" }
  has_attached_file :picture_3,
    styles: { medium: "900x900>", thumb: "300x300>" }

  validates_attachment_content_type :picture_1,
    content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :picture_2,
    content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :picture_3,
    content_type: /\Aimage\/.*\z/

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end