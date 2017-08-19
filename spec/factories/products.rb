FactoryGirl.define do
  factory :product do
    title { Faker::Name.name }
    description "MyText"
    price "9.99"

    trait :cheap do
      price 1
    end
  end
end
