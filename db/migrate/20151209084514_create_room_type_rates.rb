class CreateRoomTypeRates < ActiveRecord::Migration
  def change
    create_table :room_type_rates do |t|
      t.references :room_type, index: true, foreign_key: true
      t.date :on_date
      t.decimal :rate, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
