class CreateTriggerDeleteHotel < ActiveRecord::Migration
  def up
  	create_trigger = "CREATE TRIGGER delete_hotel_rooms
  			BEFORE DELETE ON hotels 
  			FOR EACH ROW
  			BEGIN
  				DELETE FROM rooms WHERE OLD.id = hotel_id;
  			END"

  	execute create_trigger
  end


  def down
  	drop_trigger = "DROP TRIGGER IF EXISTS delete_hotel_rooms"

  	execute drop_trigger
  end

end
