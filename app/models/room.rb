# == Schema Information
#
# Table name: rooms
#
#  id           :integer          not null, primary key
#  property_id  :integer
#  room_number  :integer
#  room_type_id :integer
#  location     :string
#  status       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_rooms_on_property_id   (property_id)
#  index_rooms_on_room_type_id  (room_type_id)
#

class Room < ActiveRecord::Base
	belongs_to :property
	belongs_to :room_type
	has_many :reservations

	enum status: [:clean, :dirty, :out_of_order]
end
