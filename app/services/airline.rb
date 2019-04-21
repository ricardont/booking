class Airline
  @@airline_name_api = JSON.parse( RestClient.get "https://api.skypicker.com/airlines" ) 
  @@airline_logo_url = "https://images.kiwi.com/airlines/"
  def self.details(iata)
  	unless iata == nil
  		logo_sizes = {sm: "32", md: "64", lg: "128"}
  		init_hash = { "iata_code" => iata, "name" => get_name(iata) } 
  		logo_sizes.inject(init_hash) { |h, (k,v)| h.merge!( "logo_#{k}" => "#{@@airline_logo_url}#{v}/#{iata}.png" )  }
		end  
  end
  private
  def self.get_name(iata)
  	@@airline_name_api.find { |h| h['id'] == iata }["name"]
  end
end