# == Schema Information
#
# Table name: properties
#
#  id            :integer          not null, primary key
#  name          :string
#  address_line1 :string
#  address_line2 :string
#  city          :string
#  state         :string
#  zip           :string
#  phone         :string
#  fax           :string
#  email         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Property < ActiveRecord::Base
	has_many :users
end
