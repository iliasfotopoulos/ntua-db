class ReportsController < ApplicationController
  def report
  	#@room_type_reservations = Reservation.joins(:room).group(:room_type).count

  	@hotel_reservations = Reservation.find_by_sql("SELECT COUNT(*) as count, hotels.name as name
	FROM reservations
	INNER JOIN hotels
	ON reservations.hotel_id = hotels.id
	GROUP BY hotels.id")

	@room_type_reservations = Reservation.find_by_sql("SELECT COUNT(*) as count, rooms.room_type as room_type
	FROM reservations
	INNER JOIN rooms
	ON reservations.room_id = rooms.id
	GROUP BY rooms.room_type")



  end
end
