class Room < ActiveRecord::Base
	belongs_to :property
	belongs_to :room_type
	has_many :reservations

	enum status: [:clean, :dirty, :out_of_order]
end
