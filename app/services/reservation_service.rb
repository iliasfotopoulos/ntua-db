class RoomNotAvailableException < StandardError; end

class ReservationService
  def initialize(room, customer, arrival, departure)
    @room = room
    @customer = customer
    @arrival = arrival
    @departure = departure
  end

=begin
  def reserve!
    ActiveRecord::Base.transaction do
      if room_available?
        Reservation.create(:room => @room, :customer => @customer, :arrival => @arrival, :departure => @departure)
      else
        raise RoomNotAvailableException
      end
    end
  end

  private
=end

  def room_available?
    reservations = Reservation.where("room_id = ?", @room.id)
    
    reservations.each do |r|
      if r.departure_date > @arrival.to_i
        return false
      else
        next
      end
    end
    return true
  end

end