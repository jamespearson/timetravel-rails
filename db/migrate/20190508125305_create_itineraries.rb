class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.string :agent_name
      t.datetime :start_at

      t.timestamps
    end
  end
end
