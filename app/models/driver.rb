class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rides
  has_many :reviews, dependent: :destroy
  validates :first_name, :last_name, :phone_number, presence: true
  has_one_attached :photo
end
