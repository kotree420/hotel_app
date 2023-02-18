class BookingResultsController < ApplicationController
  def index
    @user = current_user.id
    @booking_results = BookingResult.where("user_id = #{@user}")
  end

  def new

  end

  def confirm
    @booking_result = BookingResult.new(booking_result_params)
    @hotel = Hotel.find(params[:booking_result][:hotel_id])
    if @booking_result.invalid?
      render template: "hotels/show"
    end
  end

  def create
    @booking_result = BookingResult.new(booking_result_params)
    @hotel = Hotel.find(params[:booking_result][:hotel_id])
    begin
      @booking_result.save!
      redirect_to action: :show,id:@booking_result.id
    rescue ActiveRecord::RecordInvalid => e
      puts e
      render template: "hotels/show"
    end
  end

  def show
    @booking_result = BookingResult.find(params[:id])
    @hotel = Hotel.find(@booking_result.hotel_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def booking_result_params
      params.require(:booking_result).permit(:user_id,:hotel_id,:reserved_room,:start_date,:end_date,:total_price,:number_of_people)
    end

end
