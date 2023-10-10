FactoryBot.define do
    factory :item do
        name { Faker::Commerce.product_name }
        description { Faker::Marketing.buzzwords }
        price { Faker::Commerce.price(range: 0.1..100.0) }
        stock_quantity { Faker::Number.between(from: 1, to: 1000) }
        lead_time { Faker::Number.between(from: 1, to: 60) }
        transient do
            existing_supplier { false }
        end
      
        after(:build) do |item, evaluator|
            if evaluator.existing_supplier
                item.supplier = Supplier.order("RANDOM()").first || create(:supplier)
            else
                item.supplier = create(:supplier)
            end
        end
    end
end