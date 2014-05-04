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
    @client = Client.find(params[:client_id])
    @reservation =Reservation.find(params[:id])
  end

  def update
    @client = Client.find(params[:client_id])
    @reservation =Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params2)
      redirect_to(client_path(@client.id))
    else
      render('edit')
    end
  end

  def show
    @client = Client.find(params[:client_id])
    @reservation =Reservation.find(params[:id])
    @hotel = Hotel.find(@reservation.hotel_id)
    @room = Room.find(@reservation.room_id)
    @duration = (@reservation.departure_date - @reservation.arrival_date).to_i
    @total_cost = (@duration*@room.price).to_i
  end

  def delete
  end

  def destroy
    @reservation =Reservation.find(params[:id])
    @reservation.destroy
    redirect_to(client_path(params[:client_id]))
  end

  private

  def reservation_params
    params[:room_id] = @room.id
    params.permit(:hotel_id,:arrival_date,:departure_date,:client_id,:room_id,:payment_type)
  end

  def reservation_params2
    params.require(:reservation).permit(:arrival_date,:departure_date,:payment_type)
  end
end
