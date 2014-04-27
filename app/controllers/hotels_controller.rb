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

  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      redirect_to(hotels_path)
    else
      render('new')
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    
    if @hotel.update_attributes(hotel_params)
      redirect_to(hotel_path(@hotel.id))
    else
      render('edit')
    end
  end

  def delete
   # @hotel = Hotel.find(params[:id])
  end

  private
    def hotel_params
      params.require(:hotel).permit(:name, :city, :street, :street_number, :zip_code, :rating, :construction_year, :renovation_year)
    end


end
