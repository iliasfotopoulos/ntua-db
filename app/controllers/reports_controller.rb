class ReportsController < ApplicationController
  def report
  	#@room_type_reservations = Reservation.joins(:room).group(:room_type).count

  	@hotel_reservations = Reservation.find_by_sql("SELECT COUNT(reservations.id) AS count, hotels.name AS name
	FROM 
		reservations
	INNER JOIN 
		hotels
	ON 
		reservations.hotel_id = hotels.id
	GROUP BY 
		hotels.id")

	@room_type_reservations = Reservation.find_by_sql("SELECT COUNT(reservations.id) AS count, rooms.room_type AS room_type
	FROM 
		reservations
	INNER JOIN 
		rooms
	ON 
		reservations.room_id = rooms.id
	GROUP BY 
		rooms.room_type")

	@hotel_rooms_having = Room.find_by_sql("SELECT COUNT(rooms.id) AS count, hotels.name AS name
	FROM 
		rooms
	INNER JOIN 
		hotels
	ON 
		rooms.hotel_id = hotels.id
	GROUP BY 
		hotels.id
	HAVING 
		COUNT(rooms.id) > 5")



  end
end
