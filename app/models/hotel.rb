class Hotel < ActiveRecord::Base

	has_one :hotel_phone
	has_many :rooms #, dependent: :destroy
	has_many :reservations, through: :rooms


	validates :name, :city, presence: true
	validates :street_number, numericality: true
	validates :rating, numericality: true, 
	inclusion: {in: 0..5, message: "rating should be 0-5"}

	validates :construction_year, :renovation_year,
	inclusion: { in: 1800..Date.today.year, message: "Year should be over 1800"},
  	allow_nil: true,
  	format: 
  	{ 
    	with: /(18|19|20)\d{2}/i, 
    	message: "should be a four-digit year"
  	}


end
