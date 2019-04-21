class Flights
  @@flights_api_url = ENV['flights_api_url'].dup
  def self.search( **params)
  	#api_params = ["flyFrom", "to", "dateFrom", "adults" "children", "infants"]
  	url = params.inject(@@flights_api_url) { | u, item | u << "&#{item[0].to_s}=#{item[1].to_s}" }

   JSON.parse( RestClient.get url )["data"].map { | row | 
    routes = row['route'].map {|e| standarize_keys(e).slice('flight_no', 'city_from', 'fly_from', 'city_to', 'fly_to', 'airline', 'd_time', 'a_time' 'fare_classes') }
    standarize_keys(row).slice('fly_from', 'fly_to', 'country_from', 'country_to', 'city_from', 'city_to','price', 'flight_duration', 'a_time', 'd_time', 'distance' ).merge!('routes' => routes)
   }
  end
  private
	def self.standarize_keys(hsh)
		unless hsh == nil
			hsh.inject({}) { |h, (k,v)| h.merge!(standarize_string(k)=> v)  }
		end	
	end
	def self.standarize_string(str)
		unless str == nil
    	str.to_s.split('').inject("") { |new_s, s| s == s.upcase ? new_s << "_#{s.downcase}" : new_s << s }
  	end
	end
end

