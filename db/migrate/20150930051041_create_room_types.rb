class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.references :property, index: true, foreign_key: true
      t.string :code
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
