class FlightsController < ApplicationController
	protect_from_forgery with: :exceptions
	layout false
	def search
	  	@flights = Flights.search
		render json: @flights, status: 200
		# render json: {"status":"online"}, status: 200
	end
	# private 
	# def params
	# 	params.permit(:fly_from, :fly_to, :date_from , :date_to, :return_from, :return_to, :return_from, :adults, :children, :infants, :curr )
	# end
end