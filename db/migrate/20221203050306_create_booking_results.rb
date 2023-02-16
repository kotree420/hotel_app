class CreateBookingResults < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_results do |t|
      t.integer :user_id, null: false
      t.integer :hotel_id, null: false
      t.string :reserved_room, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :total_price, null: false

      t.timestamps
    end
  end
end
