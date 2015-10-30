class AddCheckedInToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :checked_in, :datetime
  end
end
