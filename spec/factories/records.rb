FactoryGirl.define do
  factory :record do
    sum { rand*rand(1000000000000) }
    currency 'RUR'
    undergrounds { sum/METRO_COST }
    reason { FFaker::Product.product }
    exchange_rate 1.0
  end
  
end
