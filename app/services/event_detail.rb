class EventDetail

	NON_BUSINESS_DAYS = ['Saturday', 'Sunday']

	def initialize(args)
		@event = args[:event]
	end

	def generate
		next_dates = calculate_initial_months
		print_human_readable_dates(next_dates)
	end

	private

	def calculate_initial_months
		date_start = @event.starting_date

		next_dates = 4.times.collect do
			date_start += @event.month_frequency.months
			date_start = date_start.change({day: @event.day})
			calculate_valid_date(date_start)
		end

		return next_dates
	end

	def calculate_valid_date(date)
		if date_is_valid(date)
			date
		else
			find_valid_date(date)
		end
	end

	def date_is_valid(date)
		date_day = date.strftime("%A")
		!NON_BUSINESS_DAYS.include?(date_day)
	end

	def find_valid_date(date)
		new_date = date - 1.day
		if date_is_valid(new_date)
			new_date
		else
			find_valid_date(new_date)
		end
	end

	def print_human_readable_dates(next_dates)
		next_dates.map{|date| date.strftime("%B %d, %Y") }
	end

end
