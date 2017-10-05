require 'rails_helper'

RSpec.describe EventDetail do
	context "using event 1" do
		let(:event) { Event.create(label:"Event 1", starting_date: DateTime.new(2017, 10, 5), month_frequency: 2, day: 12)}
		let(:service) { EventDetail.new(event: event)}

		it "calculates the proper dates and returns them in string format" do
			returned_dates = service.generate
			expect(returned_dates).to include("December 12, 2017")
			expect(returned_dates).to include("February 12, 2018")
			expect(returned_dates).to include("April 12, 2018")
			expect(returned_dates).to include("June 12, 2018")
		end
	end

	context "Using event 2" do
		let(:event) {Event.create(label: "Event 2", starting_date: DateTime.new(2017, 12, 5),month_frequency: 2, day: 12)}
		let(:service) { EventDetail.new(event: event)}

		it "calculates proper dates with a different return value" do
			returned_dates = service.generate
			expect(returned_dates).to include("February 12, 2018")
			expect(returned_dates).to include( "April 12, 2018")
			expect(returned_dates).to include("June 12, 2018")
			expect(returned_dates).to include("August 10, 2018")
		end
	end

end
