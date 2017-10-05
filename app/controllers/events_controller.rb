class EventsController < ApplicationController

	before_action :find_event, only:[:edit, :show, :destroy]

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			redirect_to events_path
		else
			render :new
		end
	end

	def edit
	end

	def update
		@event = Event.new(event_params)
		if @event.update
			redirect_to events_path
		else
			render :edit
		end
	end

	def show
	end



	def destroy
	end

	private

	def event_params
		params.require(:event).permit(:label, :starting_date, :month_frequency, :day)
	end

	def find_event
		@event = Event.find(params[:id])
	end
end
