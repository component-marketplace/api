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
require "test_helper"

class ItemComponentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
