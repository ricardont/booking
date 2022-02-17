require 'uri'
require 'net/http'
require 'openssl'
WebMock.allow_net_connect!
class Flights	  
	def self.search 
		url_round = URI("https://priceline-com-provider.p.rapidapi.com/v2/flight/roundTrip?departure_date=2021-12-21%2C2021-12-25&adults=1&sid=iSiX639&origin_airport_code=YWG%2CJFK&destination_airport_code=JFK%2CYWG")
		url = URI("https://priceline-com-provider.p.rapidapi.com/v2/flight/departures?departure_date=2022-06-21&sid=iSiX639&adults=1&destination_airport_code=JFK&origin_airport_code=YWG")
		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Get.new(url)
		request["x-rapidapi-host"] = 'priceline-com-provider.p.rapidapi.com'
		request["x-rapidapi-key"] = '5f5dd04520msha85586c167e52bdp141f38jsn8356613183c6'
		response = http.request(request)
		p response
		response.read_body

		# response[:Quotes].map { |f|		
		# 	carriers    = response[:Carriers].select { | p | f.OutboundLeg.CarrierIds.include?(p.CarrierId)   }
		# 	origin      = response[:Places].select { | p | p.PlaceId == f.OutboundLeg.OriginId }
		# 	destination = response[:Places].select { | p | p.PlaceId == f.OutboundLeg.DestinationId }
		# 	OpenStruct.new(
		# 		carriers: carriers ,
		# 		direct: f.Direct,
		# 		departure_date: f.OutboundLeg.DepartureDate,
		# 		origin: origin[0],
		# 		destination: destination,
		# 		price: f.MinPrice 
		# 	)			
		# }
	end
end