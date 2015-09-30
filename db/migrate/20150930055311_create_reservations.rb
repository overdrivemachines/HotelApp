class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :property, index: true, foreign_key: true
      t.date :arrival_date
      t.date :departure_date
      t.integer :adults
      t.integer :children
      t.references :room_type, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      t.float :rate
      t.text :notes

      t.timestamps null: false
    end
  end
end
