require 'uri'
require 'net/http'
require 'openssl'
WebMock.allow_net_connect!
class Flights	  
	def self.search 
		url = URI("https://priceline-com-provider.p.rapidapi.com/v1/flights/search?date_departure=2022-06-17&class_type=ECO&itinerary_type=ONE_WAY&location_arrival=NYC&location_departure=MOW&sort_order=PRICE&date_departure_return=2022-06-18&duration_max=2051&price_min=100&number_of_passengers=1&price_max=20000&number_of_stops=1")
		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE		
		request = Net::HTTP::Get.new(url)
		request["x-rapidapi-host"] = 'priceline-com-provider.p.rapidapi.com'
		request["x-rapidapi-key"] = '5f5dd04520msha85586c167e52bdp141f38jsn8356613183c6'
		response[:Quotes].map { |f|		
			carriers    = response[:Carriers].select { | p | f.OutboundLeg.CarrierIds.include?(p.CarrierId)   }
			origin      = response[:Places].select { | p | p.PlaceId == f.OutboundLeg.OriginId }
			destination = response[:Places].select { | p | p.PlaceId == f.OutboundLeg.DestinationId }
			OpenStruct.new(
				carriers: carriers ,
				direct: f.Direct,
				departure_date: f.OutboundLeg.DepartureDate,
				origin: origin[0],
				destination: destination,
				price: f.MinPrice 
			)			
		}
	end
end