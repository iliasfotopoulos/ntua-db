class CreateReservations < ActiveRecord::Migration
  
  def up
    create_table :reservations do |t|
    	t.references :hotel #foreign keys
    	t.references :room
    	t.references :client
    	t.string "reservation_date"
    	t.string "first_date"
    	t.string "last_date"
    	t.string "payment_type"

        t.timestamps
    end
    add_index("reservations", "hotel_id")
    add_index("reservations","room_id")
    add_index("reservations","client_id")
  end

  def down
  	drop_table :reservations
  end

end
