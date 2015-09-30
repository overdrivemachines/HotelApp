# == Schema Information
#
# Table name: room_types
#
#  id          :integer          not null, primary key
#  property_id :integer
#  code        :string
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RoomType < ActiveRecord::Base
  belongs_to :property
end
