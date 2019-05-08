FactoryBot.define do
  factory :destination do
    itinerary
    address_line_1 { "MyString" }
    address_line_2 { "MyString" }
    city { "MyString" }
    post_code { "MyString" }
    duration_in_minutes { 1 }
    latitude { 1.5 }
    longitude { 1.5 }
    index { 1 }
  end
end
