# frozen_string_literal: true

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
require 'test_helper'

class PurchaseReceiptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
