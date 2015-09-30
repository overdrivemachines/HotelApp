class Reservation < ActiveRecord::Base
  belongs_to :property
  belongs_to :room_type
  belongs_to :room
  has_many :guests
end
