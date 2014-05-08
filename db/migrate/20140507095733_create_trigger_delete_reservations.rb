class CreateTriggerDeleteReservations < ActiveRecord::Migration
  def up
  	create_trigger = "CREATE TRIGGER delete_client_reservations
  			BEFORE DELETE ON clients
  			FOR EACH ROW EXECUTE PROCEDURE delete_reservations()"

    delete_reservations_function ="CREATE FUNCTION delete_reservations() RETURNS TRIGGER AS $_$
        BEGIN
            DELETE FROM reservations WHERE OLD.id = client_id;
        END $_$ LANGUAGE 'plpgsql'"

    execute delete_reservations_function   
  	execute create_trigger
  end


  def down
  	drop_trigger = "DROP TRIGGER IF EXISTS delete_client_reservations"

  	execute drop_trigger
  end

end
