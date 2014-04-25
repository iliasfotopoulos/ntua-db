class CreateHotelPhones < ActiveRecord::Migration
  def change
    create_table :hotel_phones do |t|
    	t.references :hotel
    	t.string "first_phone"
    	t.string "second_phone"
    	t.string "mobile"
    	t.string "fax"

    t.timestamps
    end
    add_index("hotel_phones","hotel_id")

  end


end
