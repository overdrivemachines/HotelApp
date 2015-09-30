class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :zip
      t.string :phone1
      t.string :phone2
      t.string :id_type
      t.date :dob
      t.string :id_state
      t.string :id_number
      t.string :email
      t.references :reservation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
