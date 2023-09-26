# frozen_string_literal: true

class CreateItemComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :item_components do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :supplier_id
      t.integer :stock_quantity
      t.timestamps
    end
  end
end
