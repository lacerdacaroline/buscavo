class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user, dependent: :destroy
  after_create :create_parent
  has_many :rides, through: :users
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  def create_parent
    User.create(phone_number: user_phone_number, admin: self, first_name: user_first_name, last_name: user_last_name)
  end
end
