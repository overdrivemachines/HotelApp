class ChangeStatusTypeInRoom < ActiveRecord::Migration
  def change
  	change_column :rooms, :status, :integer
  end
end
