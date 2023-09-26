# frozen_string_literal: true

# == Schema Information
#
# Table name: suppliers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Supplier < ApplicationRecord
  has_many :item_components
  has_many :items, -> { distinct }, through: :item_components
end
