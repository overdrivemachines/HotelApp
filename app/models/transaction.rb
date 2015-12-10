# == Schema Information
#
# Table name: transactions
#
#  id             :integer          not null, primary key
#  reservation_id :integer
#  description    :string
#  amount         :decimal(8, 2)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_transactions_on_reservation_id  (reservation_id)
#

class Transaction < ActiveRecord::Base
  belongs_to :reservation
end
