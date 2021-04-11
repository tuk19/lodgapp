class CreateInns < ActiveRecord::Migration[6.1]
  def change
    create_table :inns do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.date :start_day
      t.date :end_day
      t.integer :num_people
      t.string :introduction

      t.timestamps
    end
  end
end
