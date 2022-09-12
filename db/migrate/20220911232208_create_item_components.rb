class CreateItemComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :item_components do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :supplier_id
      t.timestamps
    end
  end
end
