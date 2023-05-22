class AddOwnerIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :owner_id, :integer
  end
end
