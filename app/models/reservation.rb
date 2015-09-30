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
#

class Reservation < ActiveRecord::Base
  belongs_to :property
  belongs_to :room_type
  belongs_to :room
  has_many :guests
end
