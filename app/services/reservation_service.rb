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
    arrival_date = Date.parse @arrival
    departure_date = Date.parse @departure

    reservations.each do |r|
      before = (arrival_date < r.arrival_date) && ( departure_date < r.departure_date)
      after = (arrival_date > r.arrival_date) && ( departure_date > r.departure_date)
      if before || after
        next
      else
        return false
      end
    end
    return true
  end

end