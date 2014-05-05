class RoomsController < ApplicationController
  def index
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])
    @reservations = Reservation.where("room_id = ?", @room.id).order(arrival_date: :desc)
  end

  def new
    @hotel = Hotel.find(params[:hotel_id])
    @room = Room.new
  end

  def create
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.create(room_params)
 
    # Checkare me @room.save kai to parakatw ti sto diaolo ginetai
    #  @room = Room.new(room_params)
    
    if @room.save
      redirect_to(hotel_path(@hotel.id))
    else
      render('new')
    end
  end

  def edit
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])

    if @room.update_attributes(room_params)
      redirect_to(hotel_path(@hotel.id))
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])
    @room.destroy
    redirect_to(hotel_path(@hotel.id))
  end

  private

  def room_params
    params.require(:room).permit(:room_type, :price)
  end

end
