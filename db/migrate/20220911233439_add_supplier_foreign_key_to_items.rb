class AddSupplierForeignKeyToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :furniture_items, :supplier_id, :integer
    add_column :furniture_items, :price, :float
  end
end
