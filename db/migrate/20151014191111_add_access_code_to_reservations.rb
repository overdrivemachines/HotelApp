class AddAccessCodeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :access_code, :string
  end
end
