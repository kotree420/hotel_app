class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :room_name, null: false
      t.text :room_comment, null: false
      t.integer :unit_price, null: false
      t.string :address, null: false
      t.string :room_image, null: false

      t.timestamps
    end
  end
end
