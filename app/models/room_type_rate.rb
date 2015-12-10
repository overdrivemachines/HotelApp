# == Schema Information
#
# Table name: room_type_rates
#
#  id           :integer          not null, primary key
#  room_type_id :integer
#  on_date      :date
#  rate         :decimal(8, 2)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_room_type_rates_on_room_type_id  (room_type_id)
#

class RoomTypeRate < ActiveRecord::Base
  belongs_to :room_type
end
