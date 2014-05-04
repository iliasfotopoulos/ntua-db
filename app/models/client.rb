class Client < ActiveRecord::Base

	has_one :client_phone
	has_many :reservations

	validates :identity, :first_name, :last_name, presence: true
	validates :identity, uniqueness: {message: "This identity already exists. Identity must be unique!"}
	validates :street_number, numericality: true


end
