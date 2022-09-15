# == Schema Information
#
# Table name: sale_receipts
#
#  id              :integer          not null, primary key
#  item_id         :integer
#  organization_id :integer
#  price           :float
#  profit          :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class SaleReceipt < ApplicationRecord
  belongs_to :item
  belongs_to :organization
  # TODO: after or before create fill profit column, based on price, cost and quantity
end
