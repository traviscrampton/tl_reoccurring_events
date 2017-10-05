class EventDetail

	NON_BUSINESS_DAYS = ['Saturday', 'Sunday']

	# MONDAY_HOLIDAYS = {
	# 	"January": 3,
	# 	"Feburary":3,
	# }

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

	# def is_holiday(date)
		# month_week = get_month_week(date)
		# labor day, presidents day memorial day MKL day, veterans day, columbus day, all fall on the monday following memorial day so basically if
		# MKL is 3rd monday in Janurary
		# Presidents day 3rd monday in feb
		# Veterans day is 11th of November observed following monday if a weekend
		# independence day is observed July 4th
		# Columbus day is 2nd Monday day in October
		# thanksgiving is on the fourth thursday
		# check_for_monday_holiday(month_week, month_name)
	# end

	# def check_for_monday_holiday(month_week, month_name)
	# 	month_week = get_month_week(date)
	# 	month_name = date.strftime("%B")
	# 	day_name = date.strftime("%A")
	#
	# 	if day_name == "Monday" && MONDAY_HOLIDAYS[month_name] == month_week
	# 		return false
	# 	end
	# end

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

	# def get_month_week(date, start_day = :sunday)
	#   week_start_format = start_day == :sunday ? '%U' : '%W'
	#   month_week_start = DateTime.new(date.year, date.month, 1)
	#   month_week_start_num = month_week_start.strftime(week_start_format).to_i
	#   month_week_start_num += 1 if month_week_start.wday > 4
	#   month_week_index = date.strftime(week_start_format).to_i - month_week_start_num
	#   month_week_index + 1
	# end

end
