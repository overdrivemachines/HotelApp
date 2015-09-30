class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :property, index: true, foreign_key: true
      t.integer :room_number
      t.references :room_type, index: true, foreign_key: true
      t.string :location
      t.string :status

      t.timestamps null: false
    end
  end
end
