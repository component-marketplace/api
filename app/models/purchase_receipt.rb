# == Schema Information
#
# Table name: purchase_receipts
#
#  id                :integer          not null, primary key
#  item_component_id :integer
#  organization_id   :integer
#  price             :float
#  expected_arrival  :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class PurchaseReceipt < ApplicationRecord
  belongs_to :item_component
  belongs_to :organization
end
