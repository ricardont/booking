class FlightsController < ApplicationController
	protect_from_forgery with: :exceptions
	def search
	  render :json => Flights.search(flight_params.to_h)
	end
	private 
	def flight_params
		params.permit(:fly_from, :fly_to, :date_from , :date_to, :return_from, :return_to, :adults, :children, :infants, :curr)
	end
end