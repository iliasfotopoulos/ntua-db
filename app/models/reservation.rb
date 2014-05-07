class Reservation < ActiveRecord::Base

	belongs_to :client
	belongs_to :room
	has_one :hotel, through: :room

end
