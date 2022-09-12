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
require "test_helper"

class FurnitureItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
