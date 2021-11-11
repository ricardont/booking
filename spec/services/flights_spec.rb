require 'rails_helper'
RSpec.describe Flights do
  describe 'Flights' do
    today = DateTime.now.strftime "%d/%m/%Y" 
    tomorrow = (DateTime.now + 1).strftime "%d/%m/%Y"
    flights_response = Flights.search
    it "returns correctly some data" do
      p flights_response
      expect(flights_response[0].carriers.length).to be >= 1
      expect(flights_response[0].direct).not_to be_nil      
      expect(flights_response[0].departure_date).not_to be_nil
      expect(flights_response[0].origin).not_to be_nil
      expect(flights_response[0].destination.length).to be >= 1
      expect(flights_response[0].price).not_to be_nil     
    end
  end
end


# one way flight
  # carriers
  # direct
  # origin
  # dept date
  # destiny
  # price total

# round flight
  # carrier
    # outbount
      # dept date
      # arr date
      # price out 
    # return
      # dept date
      # arr date
      # price return  
    #price total