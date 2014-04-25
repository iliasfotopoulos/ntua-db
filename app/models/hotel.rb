class Hotel < ActiveRecord::Base

	has_one :hotel_phone
	has_many :rooms

end
