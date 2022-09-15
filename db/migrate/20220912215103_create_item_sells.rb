class CreateItemSells < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_receipts do |t|
      t.integer :item_id
      t.integer :organization_id
      t.float :price
      t.float :profit
      t.timestamps
    end
  end
end
