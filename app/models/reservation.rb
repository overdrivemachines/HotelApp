# == Schema Information
#
# Table name: reservations
#
#  id             :integer          not null, primary key
#  property_id    :integer
#  arrival_date   :date
#  departure_date :date
#  adults         :integer
#  children       :integer
#  room_type_id   :integer
#  room_id        :integer
#  rate           :float
#  notes          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  access_code    :string
#  checked_in     :datetime
#
# Indexes
#
#  index_reservations_on_property_id   (property_id)
#  index_reservations_on_room_id       (room_id)
#  index_reservations_on_room_type_id  (room_type_id)
#

class Reservation < ActiveRecord::Base
  belongs_to :property
  belongs_to :room_type
  belongs_to :room
  has_many :guests, dependent: :destroy
end
