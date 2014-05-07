class ReportsController < ApplicationController
  def report
  	@room_reservations = Reservation.group(:room_id).count
  	@room_type_reservations = Reservation.joins(:room).group(:room_type).count

  	@hotel_reservations = Reservation.find_by_sql("SELECT COUNT(*) as count, hotels.name as name
	FROM reservations
	INNER JOIN hotels
	ON reservations.hotel_id = hotels.id
	GROUP BY hotels.name")

  end
end
