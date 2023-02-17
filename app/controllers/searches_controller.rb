class SearchesController < ApplicationController

  def index

  end

  def search
    if params[:word].blank?
      @hotels = Hotel.looks("area", params[:area], params[:word])
    elsif params[:area].blank?
      @hotels = Hotel.looks("word",params[:area], params[:word])
    else
      @hotels = Hotel.looks("both",params[:area], params[:word])
    end
  end

end
