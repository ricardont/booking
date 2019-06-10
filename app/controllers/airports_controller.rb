class AirportsController < ApplicationController
	def autocomplete
		render :json => Airport.search(params[:term])
	end
end
