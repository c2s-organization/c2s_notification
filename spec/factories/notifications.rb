FactoryBot.define do
  factory :notification do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    received_at { Time.current }
  end
end
