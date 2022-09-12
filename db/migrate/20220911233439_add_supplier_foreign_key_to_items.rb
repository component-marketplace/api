class AddSupplierForeignKeyToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :supplier_id, :integer
    add_column :items, :price, :float
  end
end
