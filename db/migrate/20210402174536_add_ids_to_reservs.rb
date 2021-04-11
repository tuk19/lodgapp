class AddIdsToReservs < ActiveRecord::Migration[6.1]
  def change
    add_column :reservs, :user_id, :integer
    add_column :reservs, :inn_id, :integer
  end
end
