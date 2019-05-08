class Itinerary < ApplicationRecord
    
    has_many :destinations, :dependent => :destroy

    validates :agent_name, presence: true

    validates :start_at, presence: true

    validate :validate_start_at
    

    after_initialize :set_defaults

    # TODO: Should require at least 1 destination
    
    def end_at
        self.destinations.maximum(:departure_time)
    end

    private 



    # On initialization, sets a default start time and place.
    def set_defaults
    
        if self.destinations.empty?
            self.destinations.new(latitude:  51.5246515, longitude: -0.0852404, index: 0, duration_in_minutes: 0 )
        end
     
        self.start_at ||= 1.hour.since
    end

    # Validates that the start time is in the future
    def validate_start_at
        errors.add(:start_at, "can't be in the past") if start_at.present? && start_at < Time.now
    end

end
