class CreatePurchaseReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_receipts do |t|
      t.integer :item_component_id
      t.float :price
      t.date :expected_arrival
      t.timestamps
    end
  end
end
