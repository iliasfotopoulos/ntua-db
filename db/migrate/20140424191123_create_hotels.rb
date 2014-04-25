class CreateHotels < ActiveRecord::Migration
  
  def up
    create_table :hotels do |t|
    	t.string "name"
    	t.string "street"
    	t.integer "street_number"
    	t.string "zip_code"
    	t.string  "city"
    	t.integer "rating"
    	t.integer "construction_year"
    	t.integer "renovation_year"

		t.timestamps
    end
  end

  def down
  	drop_table :hotels
  end

end
