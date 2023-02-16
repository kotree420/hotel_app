class SearchesController < ApplicationController

  def index

  end

  def search
    if params[:word] == nil
      @hotels = Hotel.looks("area", params[:area], params[:word])
    elsif params[:area] == nil
      @hotels = Hotel.looks("word",params[:area], params[:word])
    else
      @hotels = Hotel.looks("both",params[:area], params[:word])
    end
  end

end
