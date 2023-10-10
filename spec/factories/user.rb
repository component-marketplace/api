FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        password { Faker::Alphanumeric.alphanumeric }
        transient do
            existing_org { false }
        end
      
        after(:build) do |user, evaluator|
            if evaluator.existing_org
                user.organization = Organization.order("RANDOM()").first || create(:organization)
            else
                user.organization = create(:organization)
            end
        end
    end
end