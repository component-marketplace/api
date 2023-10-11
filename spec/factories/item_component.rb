FactoryBot.define do
    factory :item_component do
        name { Faker::Commerce.product_name }
        description { Faker::Marketing.buzzwords }
        price { Faker::Commerce.price(range: 0.1..100.0) }
        stock_quantity { Faker::Number.between(from: 1, to: 1000) }
        lead_time { Faker::Number.between(from: 1, to: 60) }

        trait :with_supplier do
            after(:build) do |item_component, _evaluator|
                item_component.supplier = create(:supplier)
            end
        end
        
        trait :with_existing_supplier do
            after(:build) do |item_component, _evaluator|
                item_component.supplier = Supplier.order("RANDOM()").first
            end
        end

        trait :with_item do
            after(:create) do |item_component, _evaluator|
                create(:item_component_item, item_component:)
            end
        end

        trait :with_existing_item do
            after(:create) do |item_component, _evaluator|
                create(:item_component_item, item_component:, item: Item.order("RANDOM()").first)
            end
        end
    end
end