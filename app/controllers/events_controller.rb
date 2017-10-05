class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
	end

	def show
	end


	def edit
	end

	def destroy
	end

	private

	def event_params
		params.require(:event).permit(:label, :starting_date, :month_frequency, :day)
	end
end
