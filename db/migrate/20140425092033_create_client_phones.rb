class CreateClientPhones < ActiveRecord::Migration
  def change
    create_table :client_phones do |t|
    	t.references :client
    	t.string "first_phone"
    	t.string "second_phone"
    	t.string "mobile"
    	t.string "fax"

      t.timestamps
    end
    add_index("client_phones","client_id")
  end


end
