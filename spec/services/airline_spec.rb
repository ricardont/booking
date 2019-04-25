require 'rails_helper'

RSpec.describe Airline do
=begin
  before(:each) do
    stub_request(:get, "https://api.skypicker.com/airlines").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip, deflate',
          'Host'=>'api.skypicker.com',
          'User-Agent'=>'rest-client/2.0.2 (linux-gnu x86_64) ruby/2.4.0p0'
           }).
         to_return(status: 200, body: '[{"id": "Y4", "lcc": "1", "name": "Volaris"}, {"id": "Y4", "lcc": "1", "name": "Volaris"}]', headers: {})
  end
	it 'must return airline name' do
 		expect(Airline.details("Y4")["name"]).to eq("Volaris") 
	end
  it 'must return airline large logo url' do
    expect(Airline.details("Y4")["logo_lg"]).to eq("https://images.kiwi.com/airlines/128/Y4.png") 
  end
  it 'must return airline medium logo url' do
    expect(Airline.details("Y4")["logo_md"]).to eq("https://images.kiwi.com/airlines/64/Y4.png") 
  end
  it 'must return airline small logo url' do
    expect(Airline.details("Y4")["logo_sm"]).to eq("https://images.kiwi.com/airlines/32/Y4.png") 
  end
=end  
end


