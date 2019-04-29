class AirportsController < ApplicationController
	def index
		render :json => Airport.all 
	end
	def show
		if params[:id] 
			render :json => Airport.find(params[:id])
		end
	end
	def search
		if params[:key]
			render :json => Airport.search(params[:key])
		end
	end
	private 
	def airport_params
     params.require(:key)
	end
end
