# == Schema Information
#
# Table name: transactions
#
#  id             :integer          not null, primary key
#  reservation_id :integer
#  description    :string
#  amount         :decimal(8, 2)
#  type           :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_transactions_on_reservation_id  (reservation_id)
#

class Transaction < ActiveRecord::Base
  belongs_to :reservation

  enum type: {charge_room: 0,
  	charge_custom: 1, 
  	credit_cc: 2,
  	credit_cash: 3,
  	credit_custom: 4
  }

  # charge_custom and credit_custom are entered by user
end
