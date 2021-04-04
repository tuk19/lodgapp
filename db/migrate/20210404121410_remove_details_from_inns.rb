class RemoveDetailsFromInns < ActiveRecord::Migration[6.1]
  def change
    remove_column :inns, :start_day, :date
    remove_column :inns, :end_day, :date
    remove_column :inns, :num_people, :integer
  end
end
