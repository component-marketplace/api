class AddQuantityToPurchaseReceipts < ActiveRecord::Migration[7.0]
  def change
    add_column :purchase_receipts, :quantity, :integer
  end
end
