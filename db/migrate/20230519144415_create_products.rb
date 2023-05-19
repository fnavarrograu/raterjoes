class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :description
      t.float :price
      t.float :average_rating
      t.string :image

      t.timestamps
    end
  end
end
