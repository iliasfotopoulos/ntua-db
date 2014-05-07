class ReportsController < ApplicationController
  def report
  	@hotel_reservations = Reservation.joins(:hotel).group(:name).count
  	@room_reservations = Reservation.group(:room_id).count
  	@room_type_reservations = Reservation.joins(:room).group(:room_type).count

  end
end
