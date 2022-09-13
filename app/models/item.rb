# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  supplier_id :integer
#  price       :float
#
class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :supplier, optional: true

  has_many :item_component_items, dependent: :destroy
  has_many :item_components, through: :item_component_items
  has_many :sale_receipts
  has_many :item_subscribers

  def cost_to_build
    cost = 0
    item_components.pluck(:price).each { |price| cost += price }
    return cost
  end

  def profit
    price - cost_to_build
  end

end
