class RoomType < ActiveRecord::Base
  belongs_to :property
  has_many :reservations
  has_many :rooms
end
