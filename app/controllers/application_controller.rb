class ApplicationController < ActionController::Base
	def index
		render html: helpers.tag.strong('Welcome')
	end
end
