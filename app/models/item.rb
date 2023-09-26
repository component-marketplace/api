# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :text
#  supplier_id    :integer
#  price          :float
#  stock_quantity :integer
#  lead_time      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
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
    item_components.pluck(:price).each { |price| cost += (price || 0) }
    cost.round(2)
  end

  def profit
    ((price || 0) - cost_to_build).round(2)
  end

  def fg_buffer_basic
    total_sold_last_30_days = 0
    max_lead_time = 0
    max_quantity_ordered = 0
    receipts = sale_receipts.where('created_at > ?', 30.days.ago)
    receipts.each do |receipt|
      total_sold_last_30_days += receipt.quantity || 0
      max_lead_time = receipt.lead_time > max_lead_time ? receipt.lead_time : max_lead_time
      max_quantity_ordered = receipt.quantity > max_lead_time ? receipt.quantity : max_lead_time
    end

    max_scenario = max_quantity_ordered * max_lead_time
    average_per_day = total_sold_last_30_days / 30
    average_per_day - max_scenario
  end

  def fg_buffer_hezier_and_render; end

  def fg_buffer_greasley; end
end
