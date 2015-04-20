class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
