class AirportsController < ApplicationController
	def index
		if params[:term]
			render :json => Airport.search(params[:term])
		end
	end
	private 
	def airport_params
     params.require(:term)
	end
end
