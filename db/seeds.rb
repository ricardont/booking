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

airline_logo_url = "https://images.kiwi.com/airlines"
 airline_name_api = JSON.parse( RestClient.get "https://api.skypicker.com/airlines" ) 
 airline_name_api.map { |row|
  t=Airline.new
  t.iata = row['id']
  t.name = row['name']
  t.logo_sm = "#{airline_logo_url}/32/#{row['id']}.png"
  t.logo_md = "#{airline_logo_url}/64/#{row['id']}.png"
  t.logo_lg = "#{airline_logo_url}/128/#{row['id']}.png"
  t.save
 }
 