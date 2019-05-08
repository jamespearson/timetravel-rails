require 'rails_helper'

RSpec.describe Itinerary, type: :model do

  it "should require an agent name" do
    should validate_presence_of(:agent_name)
  end

  it "should require a start_at" do
    should validate_presence_of(:start_at)
  end

  it "should require the state_at is in the future" do
    should_not allow_value(1.week.ago).for(:start_at)
  end

end
