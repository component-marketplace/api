# == Schema Information
#
# Table name: item_subscribers
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ItemSubscriber < ApplicationRecord
  belongs_to :item
end
