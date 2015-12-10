class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :reservation, index: true, foreign_key: true
      t.string :description
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
