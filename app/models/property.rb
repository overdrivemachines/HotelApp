class Property < ActiveRecord::Base
	has_many :users
	has_many :room_types
	has_many :rooms
	has_many :reservations
end
