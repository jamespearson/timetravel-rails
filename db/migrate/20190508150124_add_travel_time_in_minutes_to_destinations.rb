class AddTravelTimeInMinutesToDestinations < ActiveRecord::Migration[5.2]
  def change
    add_column :destinations, :travel_time_in_minutes, :integer
  end
end
