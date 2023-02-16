class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :hotels, :room_image, true
    change_column_null :users, :user_image, true
  end
end
