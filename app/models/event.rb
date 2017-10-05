class Event < ActiveRecord::Base
		validates_presence_of :label, :starting_date, :month_frequency, :day
		validates_date :starting_date
		validates :is_actual_frequency?
		validates :is_month_day?


		private

		# this will validate that the month frequency is greater than 0
		def is_actual_frequency?
			if month_frequency < 1
				errors.add(:month_frequency, " must be greater than 0")
			end
		end

		#validates that the input will be between 1 and 31
		def is_month_day?
			if day > 31
				errors.add(:day, " number cannot be greater than 31.")
			elsif day < 1
				errors.add(:day, " number cannot be less than one.")
			end
		end

end
