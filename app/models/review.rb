class Review < ApplicationRecord
  belongs_to :driver
  belongs_to :admin
  belongs_to :ride
end
