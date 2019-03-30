class CreateAirports < ActiveRecord::Migration[5.2]
  def change
    create_table :airports do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :iata
      t.string :icao
      t.float :latitude
      t.float :longitude
      t.integer :altitude
      t.string :dst
      t.string :tz
      t.string :type
      t.string :source

      t.timestamps
    end
  end
end
