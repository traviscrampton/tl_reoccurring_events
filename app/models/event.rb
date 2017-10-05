class Event < ActiveRecord::Base
		validates_presence_of :label, :starting_date, :month_frequency, :day
		validate :month_frequency, :if => :is_actual_frequency?
		validate :day, :if => :is_month_day?


		private

		# this will validate that the month frequency is greater than 0
		def is_actual_frequency?
			if !!month_frequency && month_frequency < 1
				errors.add(:month_frequency, " must be greater than 0")
			end
		end

		#validates that the input will be between 1 and 31
		def is_month_day?
			if !!self.day
				if self.day > 31
					errors.add(:day, " number cannot be greater than 31.")
				elsif self.day < 1
					errors.add(:day, " number cannot be less than one.")
				end
			end
		end

end
