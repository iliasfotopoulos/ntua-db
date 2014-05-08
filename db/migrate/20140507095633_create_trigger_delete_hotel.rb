class CreateTriggerDeleteHotel < ActiveRecord::Migration
  def up
  	create_trigger = "CREATE TRIGGER delete_hotel_rooms
  			AFTER DELETE ON hotels 
  			FOR EACH ROW EXECUTE PROCEDURE delete_rooms()"

        delete_rooms_function ="CREATE FUNCTION delete_rooms() RETURNS TRIGGER AS $_$
        BEGIN
            DELETE FROM rooms WHERE OLD.id = hotel_id;
        RETURN NULL;
        END $_$ LANGUAGE 'plpgsql';"

    execute delete_rooms_function    
  	execute create_trigger
  end


  def down
  	drop_trigger = "DROP TRIGGER IF EXISTS delete_hotel_rooms"

  	execute drop_trigger
  end

end
