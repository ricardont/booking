class AirportsController < ApplicationController
	def autocomplete
		render :json => Airport.search(params[:term]).map { | result | {:id => result.iata, :value => "#{result.name}, #{result.city}" } }
	end
end
