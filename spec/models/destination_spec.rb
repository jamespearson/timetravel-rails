require 'rails_helper'

RSpec.describe Destination, type: :model do
  it "should belong to a route" do
    should belong_to(:itinerary)
  end 

  it "should require a route" do
    should validate_presence_of(:itinerary)
  end

  it "should require an index" do
    should validate_presence_of(:index)
  end

  it "should require an index of 0 or greater" do
    should validate_numericality_of(:index).is_greater_than_or_equal_to(0) 
  end


  it 'should require the index to be unique to the route' do
    should validate_uniqueness_of(:index).scoped_to(:itinerary_id)
  end

  it "should require an address_line_1" do
    should validate_presence_of(:address_line_1)
  end

  it "should require a city" do
    should validate_presence_of(:city)
  end

  it "should require a post code" do
    should validate_presence_of(:post_code)
  end
  
  it "should require a latitude" do
    should validate_presence_of(:latitude)
  end

  it "shoudl require a longitude" do
    should validate_presence_of(:longitude)
  end
  
  it "should only accept a positive number for the duration of visit" do
    should validate_numericality_of(:duration_in_minutes).is_greater_than_or_equal_to(0) 
  end
  
end
