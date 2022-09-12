# == Schema Information
#
# Table name: item_component_items
#
#  id                :integer          not null, primary key
#  item_component_id :integer
#  furniture_item_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class ItemComponentItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
