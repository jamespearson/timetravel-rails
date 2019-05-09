FactoryBot.define do
  factory :destination do
    itinerary
    address_line_1 { "New Cross Road" }
    city { "London" }
    post_code { "SE14 5AA" }
    duration_in_minutes { 1 }
    latitude { 51.5246515 }
    longitude { -0.0852404 }
    sequence(:index) { |n| n }
  end
end
