class Client < ActiveRecord::Base

	has_one :client_phone
	has_many :reservations

end
