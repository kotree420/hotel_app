class AddUserIdToHotels < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :user_id, :integer
  end
end
