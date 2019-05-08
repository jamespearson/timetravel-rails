class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.references :itinerary, foreign_key: true
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :post_code
      t.integer :duration_in_minutes
      t.float :latitude
      t.float :longitude
      t.datetime :arrival_time
      t.datetime :departure_time
      t.integer :index

      t.timestamps
    end
  end
end
