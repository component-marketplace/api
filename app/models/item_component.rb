# == Schema Information
#
# Table name: item_components
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :text
#  price          :float
#  supplier_id    :integer
#  stock_quantity :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class ItemComponent < ApplicationRecord
  belongs_to :supplier, optional: true

  has_many :item_component_items, dependent: :destroy
  has_many :items, through: :item_component_items

end
