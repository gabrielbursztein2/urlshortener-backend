FactoryBot.define do
  factory :url_short do
    url { Faker::Internet.url }
    short_url { Faker::Internet.url }
    visits { Faker::Number.number(digits: 2) }
  end
end
