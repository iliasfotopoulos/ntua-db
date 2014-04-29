class Room < ActiveRecord::Base

	belongs_to :hotel
	validates :hotel_id, presence: true

	has_many :reservations

end
