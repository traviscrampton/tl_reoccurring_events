FactoryGirl.define do

  factory :event_1 do
		label "Event 1"
		starting_date DateTime.new(2017, 10, 5)
		month_frequency 2
		day 12
	end

  factory :event_2 do
		label "Event 2"
		starting_date DateTime.new(2017, 12, 5)
		month_frequency 2
		day 12
	end
end
