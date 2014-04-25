class CreateClients < ActiveRecord::Migration
  
  def up
    create_table :clients do |t|
    	t.string "identity"
    	t.string "first Name"
    	t.string "last Name"
    	t.string "street"
    	t.integer "street_number"
    	t.string "zip_code"
    	t.string  "city"
    	t.string "credit_card_number"
        t.timestamps
    end
  end

  def down
  	drop_table :clients
  end

end
