class Hotel < ApplicationRecord
  mount_uploader :room_image, HotelUploader
  has_many :booking_results
  belongs_to :user

  mount_uploader :room_image, HotelUploader

  def self.looks(category,area,word)
    if category == "area"
      @hotels = Hotel.where("address LIKE?", "%#{area}%")
    elsif category == "word"
      @hotels = Hotel.where("room_name LIKE?", "%#{word}%").or(Hotel.where("room_comment LIKE?", "%#{word}%"))
    else
      @hotels = Hotel.merge(Hotel.where("address LIKE?", "%#{area}%"))
              .merge(Hotel.where("room_name LIKE?", "%#{word}%").or(Hotel.where("room_comment LIKE?", "%#{word}%")))
    end
  end

  with_options presence: true do
    validates :room_name
    validates :room_comment
    validates :unit_price, numericality: { greater_than_or_equal_to: 1 }
    validates :address
    validates :user_id
  end

end
