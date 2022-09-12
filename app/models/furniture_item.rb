# == Schema Information
#
# Table name: furniture_items
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  supplier_id :integer
#  price       :float
#
class FurnitureItem < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  belongs_to :supplier, optional: true

  has_many :item_component_items, dependent: :destroy
  has_many :item_components, through: :item_component_items
end
