class CreateTriggerDeleteReservations < ActiveRecord::Migration
  def up
  	create_trigger = "CREATE TRIGGER delete_client_reservations
  			BEFORE DELETE ON clients 
  			FOR EACH ROW
  			BEGIN
  				DELETE FROM reservations WHERE OLD.id = client_id;
  			END"

  	execute create_trigger
  end


  def down
  	drop_trigger = "DROP TRIGGER IF EXISTS delete_client_reservations"

  	execute drop_trigger
  end

end
