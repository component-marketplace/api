class CreateItemComponentItems < ActiveRecord::Migration[7.0]
  def change
    create_table :item_component_items do |t|
      t.integer :item_component_id
      t.integer :furniture_item_id
      t.timestamps
    end
  end
end
