FactoryGirl.define do
  sequence(:product_sequence) { |n| "Product ##{n} - #{rand(9999)}" }

  factory :product do
    name { Factory.next :product_sequence }
  end
end
