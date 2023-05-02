class Ride < ApplicationRecord
  belongs_to :user
  has_many :notifies
  belongs_to :driver
  has_many :reviews, dependent: :destroy
  reverse_geocoded_by :latitude, :longitude, address: :start_address
  after_validation :reverse_geocode, if: ->(obj) { obj.latitude.present? and obj.latitude_changed? }
end
