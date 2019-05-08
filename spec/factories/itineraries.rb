FactoryBot.define do
  factory :itinerary do
    agent_name { "Jo Blogs" }
    start_at { 1.hours.since }
  end
end
