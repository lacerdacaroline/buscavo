class User < ApplicationRecord
  belongs_to :admin
  has_many :rides
  has_many :notifies, dependent: :destroy

  validates :phone_number, presence: true
end
