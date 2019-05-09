FactoryBot.define do
  factory :destination do
    itinerary
    address_line_1 { "New Cross Road" }
    city { "London" }
    post_code { "SE14 5AA" }
    duration_in_minutes { 1 }
    latitude { 1.5 }
    longitude { 1.5 }
    sequence(:index) { |n| n }
  end
end
