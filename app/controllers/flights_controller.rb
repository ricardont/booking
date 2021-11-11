class FlightsController < ApplicationController
	protect_from_forgery with: :exceptions
	layout false
	def search
	  	# @flights = Flights.search(params.to_h)
	  	@flights = Flights.search
	end
	# private 
	# def params
	# 	params.permit(:fly_from, :fly_to, :date_from , :date_to, :return_from, :return_to, :return_from, :adults, :children, :infants, :curr )
	# end
end