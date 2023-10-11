FactoryBot.define do 
    factory :sale_receipt do
        cost_to_build { Faker::Commerce.price(range: 0.1..100.0) }
        price { Faker::Commerce.price(range: 0.1..100.0) }
        quantity { Faker::Number.between(from: 1, to: 1000) }

        trait :with_existing_org do
            after(:build) do |sale_receipt, _evaluator|
                sale_receipt.organization = Organization.order("RANDOM()").first
            end
        end

        trait :with_org do
            after(:build) do |sale_receipt, _evaluator|
                sale_receipt.organization = create(:organization)
            end
        end

        trait :with_existing_item do
            after(:build) do |sale_receipt, _evaluator|
                sale_receipt.item = Item.order("RANDOM()").first
            end
        end

        trait :with_item do
            after(:build) do |sale_receipt, _evaluator|
                sale_receipt.item = create(:item)
            end
        end
    end
end