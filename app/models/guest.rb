# == Schema Information
#
# Table name: guests
#
#  id             :integer          not null, primary key
#  first_name     :string
#  last_name      :string
#  address_line1  :string
#  address_line2  :string
#  city           :string
#  zip            :string
#  phone1         :string
#  phone2         :string
#  id_type        :string
#  dob            :date
#  id_state       :string
#  id_number      :string
#  email          :string
#  reservation_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Guest < ActiveRecord::Base
  belongs_to :reservation
end
