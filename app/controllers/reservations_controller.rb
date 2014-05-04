class ReservationsController < ApplicationController
  def index
  end

  def new
    @client = Client.find(params[:client_id])
    @hotels = Hotel.all
    @rooms = Room.all
  end

=begin
  def available_rooms
    @hotel = Hotel.find(params[:hotel_id])
    @client = Client.find(params[:client_id])
    @rooms = (@hotel.rooms).where("room_type = ?", params[:room_type])
    @room = @rooms.first
  end
=end

  def create
    @hotels = Hotel.all
    @hotel = Hotel.find(params[:hotel_id])
    @client = Client.find(params[:client_id])
    @rooms = (@hotel.rooms).where("room_type = ?", params[:room_type])

    if @rooms.any?
      @room = @rooms.first
      @reservation = @client.reservations.create(reservation_params)
      if(@reservation)
        redirect_to(client_path(@client.id))
      end
    else
      # Tha prepei na prostethoun validations kai minimata, xamos
      render('new') 
    end  
    
  end

  def edit
  end

  def show
  end

  def delete
  end

  private

  def reservation_params
    params[:room_id] = @room.id
    params.permit(:hotel_id,:arrival_date,:departure_date,:client_id,:room_id)
  end
end
