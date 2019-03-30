require 'rails_helper'

RSpec.describe AirportsController, type: :controller do

	describe 'listing all airports' do
		it 'must respond with status 200 ok' do
			get :index
			expect(response.status).to eq(200)
		end 
		it 'respond in json format' do
			get :index
			expect(response.content_type).to eq "application/json"
		end
	end
	describe 'retrieve airports' do 	
		it 'searching in city, name, iata code' do
			get :search, params: { key: "Dallas" }  
			expect(JSON.parse(response.body).length).to eq(4)
		end
	end
   
end
