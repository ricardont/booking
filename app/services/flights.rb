require 'uri'
require 'net/http'
require 'openssl'
WebMock.allow_net_connect!
class Flights	  
	def self.search 
		url = URI("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsequotes/v1.0/US/USD/en-US/SFO-sky/JFK-sky/2021-12")
		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		request = Net::HTTP::Get.new(url)
		request["x-rapidapi-host"] = 'skyscanner-skyscanner-flight-search-v1.p.rapidapi.com'
		request["x-rapidapi-key"]  = '5f5dd04520msha85586c167e52bdp141f38jsn8356613183c6'
		response = JSON.parse(http.request(request).read_body, object_class: OpenStruct)
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