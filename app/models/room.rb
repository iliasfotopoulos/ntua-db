class Room < ActiveRecord::Base

	belongs_to :hotel
	validates :hotel_id, presence: true
	
	has_many :reservations

	# Validation
	validates :price, :room_type, presence: true
	validates :price, numericality: {greater_than: 0}

end
