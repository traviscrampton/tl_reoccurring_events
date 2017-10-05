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
	end
end
