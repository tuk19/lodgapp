class AddImageToInns < ActiveRecord::Migration[6.1]
  def change
    add_column :inns, :image, :string
  end
end
