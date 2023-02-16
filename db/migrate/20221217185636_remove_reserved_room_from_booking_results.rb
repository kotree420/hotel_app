class RemoveReservedRoomFromBookingResults < ActiveRecord::Migration[6.1]
  def change
    remove_column :booking_results, :reserved_room, :string
  end
end
