class Room < ActiveRecord::Base
  belongs_to :property
  belongs_to :room_type
end
