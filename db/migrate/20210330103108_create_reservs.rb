class CreateReservs < ActiveRecord::Migration[6.1]
  def change
    create_table :reservs do |t|
      t.date :start_day
      t.date :end_day
      t.integer :num_pepo
      t.integer :fee

      t.timestamps
    end
  end
end
