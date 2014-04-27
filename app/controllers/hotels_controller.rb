class HotelsController < ApplicationController
  def index
    @hotels = Hotel.order("id")
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
    @hotel = Hotel.new
  end

  def edit
  end

  def delete
  end
end
