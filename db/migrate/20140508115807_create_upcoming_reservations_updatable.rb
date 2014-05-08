class CreateUpcomingReservationsUpdatable < ActiveRecord::Migration
def up
  	create_view = " CREATE OR REPLACE VIEW upcoming_reservations_updatable AS
  					SELECT *
  					FROM reservations
  					WHERE departure_date > CURDATE()
  					ORDER BY arrival_date"
  	execute create_view
  end

  def down
  	drop_view = "DROP VIEW IF EXISTS upcoming_reservations_updatable"
  	execute drop_view
  end

end
