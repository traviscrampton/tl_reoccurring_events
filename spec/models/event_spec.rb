require 'rails_helper'

RSpec.describe Event, :type => :model do

	describe 'validations' do

		it 'validates presence of all four fields' do
			event = Event.new(label: '', starting_date: nil, month_frequency: nil, day: nil)
 			event.valid?
			expect(event.errors[:label]).to include("can't be blank")
			expect(event.errors[:starting_date]).to include("can't be blank")
			expect(event.errors[:month_frequency]).to include("can't be blank")
			expect(event.errors[:day]).to include("can't be blank")
		end

		it 'validates that day is greater than 0' do
			event = Event.new(day: 0)
			event.valid?
			expect(event.errors[:day]).to include(" number cannot be less than one.")
		end

		it 'validates that day is less than 31' do
			event = Event.new(day: 35)
			event.valid?
			expect(event.errors[:day]).to include(" number cannot be greater than 31.")
		end

		it 'validates the month frequency is greater than one' do
			event = Event.new(month_frequency: 0)
			event.valid?
			expect(event.errors[:month_frequency]).to include(' must be greater than 0')
		end
	end
end
