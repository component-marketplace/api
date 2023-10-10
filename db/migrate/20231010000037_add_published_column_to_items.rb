class AddPublishedColumnToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :published, :boolean, default: false
  end
end
