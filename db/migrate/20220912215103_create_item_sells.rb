# frozen_string_literal: true

class CreateItemSells < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_receipts do |t|
      t.integer :item_id
      t.integer :organization_id
      t.float :price
      t.integer :quantity
      t.float :cost_to_build
      t.integer :lead_time, default: 0
      t.timestamps
    end
  end
end
