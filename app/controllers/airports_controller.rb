class AirportsController < ApplicationController
	def index
		@airports = Airport.all 
        @airports = Airport.search(params[:search]).map { | result | {:id => result.iata, :value => "#{result.name}, #{result.city}" } } if params[:search].present?
		render :json => @airports 
	end	
end
