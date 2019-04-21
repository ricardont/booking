require 'rails_helper'

RSpec.describe Airline do
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
  
end


