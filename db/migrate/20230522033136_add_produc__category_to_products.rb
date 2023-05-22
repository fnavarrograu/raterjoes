class AddProducCategoryToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :product_category, :integer
  end
end
