FactoryBot.define do
  factory :purchase_form do
    item_id { 1 }
    user_id { 1 }
    postcode { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    phone_number { '0' + Faker::Number.number(digits: 10).to_s }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
