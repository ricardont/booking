# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
csv_text = File.read(Rails.root.join('db', 'airports_test.csv'))
csv = CSV.parse(csv_text, :headers => true, )
csv.each do |row|
  t = Airport.new
	t.name = row[0]
	t.city = row[1]
	t.country = row[2]
	t.iata = row[3]
	t.icao = row[4]
	t.latitude = row[5]
	t.longitude = row[6]
	t.altitude = row[7]
	t.dst = row[8]
  t.save
end

Airline.create(iata: "Y4",name: "Volaris", logo_sm: "https://images.kiwi.com/airlines/32/Y4.png", logo_md: "https://images.kiwi.com/airlines/64/Y4.png", logo_lg: "https://images.kiwi.com/airlines/128/Y4.png" )
Airline.create(iata: "VB",name: "VivaAerobus", logo_sm: "https://images.kiwi.com/airlines/32/VB.png", logo_md: "https://images.kiwi.com/airlines/64/VB.png", logo_lg: "https://images.kiwi.com/airlines/128/VB.png" )

 