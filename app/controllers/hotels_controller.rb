class HotelsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to action: :show,id:@hotel.id
      #showに対して@hotelレコードのidパラメータをパラメータを送る
    else
      render :new
    end
  end

  def show
    # @user = current_user
    @hotel = Hotel.find(params[:id])
    @booking_result = BookingResult.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def hotel_params
      params.require(:hotel).permit(:room_name, :room_comment, :unit_price, :address, :room_image)
    end
end
