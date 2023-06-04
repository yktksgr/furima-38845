FactoryBot.define do
  factory :item do
    name               { "名前" }
    description        { "説明" }
    category_id        { 1 }
    status_id          { 1 }
    shipping_cost_id   { 1 }
    prefecture_id      { 1 }
    shipping_date_id   { 1 }
    price              { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
