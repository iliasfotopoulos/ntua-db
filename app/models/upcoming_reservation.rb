class UpcomingReservation < ActiveRecord::Base

	self.table_name = "upcoming_reservations"
	self.primary_key = "id"

	belongs_to :client
	belongs_to :room

end
