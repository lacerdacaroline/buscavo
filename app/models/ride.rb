class Ride < ApplicationRecord
  belongs_to :user
  has_many :notifies
  belongs_to :driver
  has_many :reviews, dependent: :destroy
end
