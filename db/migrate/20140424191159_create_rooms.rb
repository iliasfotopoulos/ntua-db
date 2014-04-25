class CreateRooms < ActiveRecord::Migration
  def up
    create_table :rooms do |t|
    	t.references :hotel #t.integer "hotel_id" -> Foreign Key
    	t.string "type"
    	t.integer "price"
      t.timestamps
    end
    add_index("rooms","hotel_id")
  end

  def down
  	drop_table :rooms
  end

end
