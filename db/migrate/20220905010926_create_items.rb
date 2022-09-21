class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :supplier_id
      t.float :price
      t.integer :stock_quantity
      t.integer :lead_time
      t.timestamps
    end
  end
end
