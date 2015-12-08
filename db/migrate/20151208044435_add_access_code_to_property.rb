class AddAccessCodeToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :access_code, :string
  end
end
