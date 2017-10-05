class CreateEventsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
			t.string :label
			t.datetime :starting_date
			t.integer :month_frequency
			t.integer :day

			t.timestamps
    end
  end
end
