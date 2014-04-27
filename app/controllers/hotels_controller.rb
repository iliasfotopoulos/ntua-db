class HotelsController < ApplicationController
  def index
    @hotels = Hotel.order("id")
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
  end

  def edit
  end

  def delete
  end
end
