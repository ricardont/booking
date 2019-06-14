class FlightsController < ApplicationController
	protect_from_forgery with: :exceptions
	def search
	  	@flights = Flights.search(flight_params.to_h)
		respond_to do |format|
  			format.html
  			format.json { render json: @flights }
		end
	  #render :json => @flights
	end
	private 
	def flight_params
		params.permit(:fly_from, :fly_to, :date_from , :date_to, :return_from, :return_to, :return_from, :return_to, :adults, :children, :infants, :curr )
	end
end