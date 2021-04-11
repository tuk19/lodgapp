class AddIdsToInns < ActiveRecord::Migration[6.1]
  def change
    add_column :inns, :user_id, :integer
    add_column :inns, :reserv_id, :integer
  end
end
