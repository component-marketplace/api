class AddLeadTimeToItemComponents < ActiveRecord::Migration[7.0]
  def change
    add_column :item_components, :lead_time, :integer
  end
end
