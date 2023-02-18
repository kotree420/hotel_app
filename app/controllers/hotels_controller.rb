class HotelsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    #@hotelsをログイン中のユーザに紐づいたホテルのみに絞り込む
    @user = current_user.id
    @hotels = Hotel.where("user_id = #{@user}")
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
      params.require(:hotel).permit(:room_name, :room_comment, :unit_price, :address, :room_image, :user_id)
    end
end
