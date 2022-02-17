require 'rails_helper'

RSpec.describe FlightsController, type: :controller do    
	describe 'Get search' do
		it 'must respond with status 200 ok' do
			get :search
			expect(response.status).to eq(200)
		end 
		it 'respond in json format' do
			get :search
			expect(response.content_type).to eq "application/json"
		end
	end
end
