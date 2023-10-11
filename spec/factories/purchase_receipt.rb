FactoryBot.define do 
    factory :purchase_receipt do
        price { Faker::Commerce.price(range: 0.1..100.0) }
        quantity { Faker::Number.between(from: 1, to: 1000) }
        expected_arrival { Faker::Date.forward(days: 23) }

        trait :with_existing_org do
            after(:build) do |purchase_receipt, _evaluator|
                purchase_receipt.organization = Organization.order("RANDOM()").first
            end
        end

        trait :with_org do
            after(:build) do |purchase_receipt, _evaluator|
                purchase_receipt.organization = create(:organization)
            end
        end

        trait :with_existing_item_component do
            after(:build) do |purchase_receipt, _evaluator|
                purchase_receipt.item_component = ItemComponent.order("RANDOM()").first
            end
        end

        trait :with_item do
            after(:build) do |purchase_receipt, _evaluator|
                purchase_receipt.item = create(:item_component)
            end
        end
    end
end