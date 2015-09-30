class AddPropertyToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :property, index: true, foreign_key: true
  end
end
