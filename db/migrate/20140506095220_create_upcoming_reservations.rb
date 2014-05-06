class CreateUpcomingReservations < ActiveRecord::Migration
  def up
  	create_view = " CREATE OR REPLACE VIEW upcoming_reservations AS
  					SELECT reservations.id, reservations.arrival_date, reservations.departure_date, reservations.created_at, reservations.updated_at, clients.first_name, clients.last_name, hotels.name, rooms.room_type
  					FROM reservations
            INNER JOIN clients
            ON reservations.client_id = clients.id
            INNER JOIN hotels
            ON reservations.hotel_id = hotels.id
            INNER JOIN rooms
            ON reservations.room_id = rooms.id
  					WHERE arrival_date > CURDATE()
  					ORDER BY arrival_date"
  	execute create_view
  end

  def down
  	drop_view = "DROP VIEW IF EXISTS upcoming_reservations"
  	execute drop_view
  end

end
