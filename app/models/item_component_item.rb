# == Schema Information
#
# Table name: item_component_items
#
#  id                :integer          not null, primary key
#  item_component_id :integer
#  item_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class ItemComponentItem < ApplicationRecord
  belongs_to :item
  belongs_to :item_component
  has_many :purchase_receipts

end
