class CreateItemSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :item_subscribers do |t|
      t.integer :item_id
      t.string :name
      t.timestamps
    end
  end
end
