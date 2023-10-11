FactoryBot.define do
    factory :item_component_item do
        item { create(:item) }
        item_component { create(:item_component) }
    end
end