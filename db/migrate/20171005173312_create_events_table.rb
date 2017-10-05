class CreateEventsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
			t.string :label
			t.date :starting_date
			t.integer :month_frequency
			t.integer :day
    end
  end
end
