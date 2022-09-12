# == Schema Information
#
# Table name: item_components
#
#  id             :integer          not null, primary key
#  component_name :string
#  price          :float
#  supplier_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class ItemComponent < ApplicationRecord
  belongs_to :supplier

  has_many :item_component_items
  has_many :furniture_items, through: :item_component_items
end
