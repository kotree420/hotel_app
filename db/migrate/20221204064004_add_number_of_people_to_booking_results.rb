class AddNumberOfPeopleToBookingResults < ActiveRecord::Migration[6.1]
  def change
    add_column :booking_results, :number_of_people, :integer, null: false
  end
end
