class Destination < ApplicationRecord

  belongs_to :itinerary
  
  geocoded_by :address
  
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if results.first.address.present? && geo = results.first
      obj.address_line_1, obj.address_line_2 = geo.address.split(",")
      obj.city    = geo.city
      obj.post_code = geo.postal_code
    end
  end

  validates :address_line_1,   presence: true

  validates :city, presence: true

  validates :duration_in_minutes, presence: true,
                                  numericality: { greater_than_or_equal_to: 0}

  validates :index, presence: true,
                    numericality: { greater_than_or_equal_to: 0},
                    uniqueness: {scope: :itinerary_id}

  validates :itinerary, presence: true

  validates :latitude, presence: true

  validates :longitude, presence: true

  validates :post_code, presence: true

  validate :validate_is_in_london?

  # Geocode the address, unless the lat / lng has already changed
  before_validation :geocode, if:  Proc.new { has_address_changed? },
                              unless: Proc.new {  have_coordinates_changed? }

  # Reverse Geocode any coordinates that have been manually set                                          
  before_validation :reverse_geocode, if: Proc.new { have_coordinates_changed? }



  before_save :set_times

  def address
      [address_line_1, address_line_2, city, post_code].compact.join(', ')
  end

  

  def set_times
    
    return unless itinerary.present?
    
    # If we have a destation before this one..
    if previous_destination = itinerary.destinations.where("index < ?", index).first

      # Lookup the previous destinations information as the departure information
      previous_departure_time = previous_destination.departure_time || Time.now
      previous_coordinates = [previous_destination.latitude, previous_destination.longitude]

    # If this is the first destination, then use the office and route start time  
    else 
      previous_departure_time = itinerary.start_at
      previous_coordinates = [ 51.5246515, -0.0852404]
    end

    next_coordinates = [latitude, longitude]

    self.travel_time_in_minutes = CityMapper.new.travel_time(previous_departure_time, previous_coordinates, next_coordinates)

    if self.travel_time_in_minutes
      self.arrival_time = (travel_time_in_minutes).minutes.since(previous_departure_time)
      self.departure_time = arrival_time + duration_in_minutes
    end

  end

  private

  def validate_is_in_london?
    return unless latitude.present? && longitude.present? 

    distance_to_london = self.distance_to([51.507351, -0.127758])
    errors.add(:post_code, "cannot be outside London") if distance_to_london > 25
  end

  def has_address_changed?
    changes_to_save.include?("address_line_1") || 
    changes_to_save.include?("address_line_2") || 
    changes_to_save.include?("city") ||
    changes_to_save.include?("post_code")
  end

  def have_coordinates_changed?
    changes_to_save.include?("latitude")  
    changes_to_save.include?("longitude") 
  end

  

end
