class Hotel < ApplicationRecord
  mount_uploader :room_image, HotelUploader
  has_many :booking_results

  mount_uploader :room_image, HotelUploader

  def self.looks(category,area,word)
    if category == area
      @hotels = Hotel.where("address LIKE?", "%#{area}%")
    elsif category == word
      @hotels = Hotel.where("room_name LIKE?", "%#{word}%")
    else
      @hotels = Hotel.where("address LIKE? AND room_name LIKE?", "%#{area}%", "%#{word}%")
    end
  end

  validates :unit_price, numericality: { greater_than_or_equal_to: 1 }

end
