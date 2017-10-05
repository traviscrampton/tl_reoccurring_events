class EventDetail

	def initialize(args)
		@event = args[:event]
	end

	def generate
		next_dates = calculate_initial_months
		valid_dates = valid_next_dates(next_dates)
	end

	def calculate_initial_months
		date_start = @event.starting_date

		next_dates = 4.times.collect do
			date_start += @event.month_frequency.months
			date_start = date_start.change({day: @event.day}) 
			date_start
		end

		return next_dates
	end




end
