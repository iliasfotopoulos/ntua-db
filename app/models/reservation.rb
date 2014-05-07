class Reservation < ActiveRecord::Base

	belongs_to :client
	validates :client_id, presence: true

	belongs_to :room
	validates :room_id, presence: true

	has_one :hotel, through: :room
	validates :hotel_id, presence: true

	validates :arrival_date, :departure_date, presence: true

	validate :arrival_before_departure, :arrival_date_cannot_be_in_the_past, :departure_date_cannot_be_in_the_past

	def arrival_before_departure
	    errors.add(:arrival_date, "must be before departure date") if arrival_date >= departure_date
  	end

  	def arrival_date_cannot_be_in_the_past
	    errors.add(:arrival_date, "can't be in the past") if arrival_date < Date.today
  	end

  	def departure_date_cannot_be_in_the_past
	    errors.add(:departure_date, "can't be in the past") if departure_date < Date.today
  	end  

end
