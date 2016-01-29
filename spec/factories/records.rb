FactoryGirl.define do
  factory :record do
    sum { rand*rand(1000000000000) }
    currency 'RUR'
    undergrounds { sum/24000000000 }
    reason 'Clockwork Orange'
    exchange_rate 1.0
  end

end
