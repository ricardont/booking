require 'rails_helper'

# # RSpec.describe FlightsController, type: :controller do
#     describe "GET index" do
#         it "returns http success" do
#         #   get :flights_search
#             get "/flights/search"
#         #   expect(response.body).to eq('{"status":"online"}')
#             expect(response.status).to eq(200)
#         end
#     end
# end
describe FlightsController do 
    context "GET flights" do
        it "returns http success" do
            #   get :flights_search

            get "/flights/search"

            
            expect(response.body).to eq('{"status":"online"}')
            expect(response.status).to eq(200)
        end  
    end
end  