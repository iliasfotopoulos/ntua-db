# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Hotel.create(name: "Pegasus", street: "Pasalidou", street_number: 12, zip_code: 14782, city: "Mykonos", rating: 4, construction_year: 1982)
Hotel.create(name: "Vista Loca", street: "Karagiorgi", street_number: 22, zip_code: 42789, city: "Athens", rating: 5, construction_year: 1964, renovation_year: 2007)
Hotel.create(name: "Karas", street: "Fragkolisias", street_number: 4, zip_code: 11631, city: "Athens", rating: 2, construction_year: 2002)
Hotel.create(name: "Arcadia Palace", street: "Kolokotroni", street_number: 13, zip_code: 22100, city: "Tripoli", rating: 5, construction_year: 1947, renovation_year: 2006)
Hotel.create(name: "Harpe", street: "Maragkougia", street_number: 1, zip_code: 22306, city: "Xalkidiki", rating: 3, construction_year: 1989)

room_type = ["Single","Double","Junior Suite","Suite"]

Hotels = Hotel.all

Hotels.each do |hotel|
	x = rand(2..10)
	x.times do
		Room.create(hotel_id: hotel.id, room_type: room_type.sample, price: rand(20..200) )
	end
end

Client.create(identity: "XB194789", first_name:"Fotini", last_name:"Xeniou", street:"Mpoumpoulinas", street_number: 42, zip_code:"22801", city:"Lilipoupoli", credit_card_number:"1980-4580-7902-1907")
Client.create(identity: "AB031098", first_name:"Takis", last_name:"Papadopoulos", street:"Anaksarxou", street_number: 9, zip_code:"11631", city:"Paramithoupoli", credit_card_number:"1298-0123-4538-4242")
Client.create(identity: "TR424242", first_name:"Nikos", last_name:"Xaramofais", street:"Mparmpagianni", street_number: 108, zip_code:"10180", city:"Arguroupoli", credit_card_number:"0124-0298-0218-1908")
Client.create(identity: "BX194108", first_name:"Xristina", last_name:"Karamola", street:"Tarama", street_number: 79, zip_code:"11070", city:"Athina", credit_card_number:"1654-4410-3482-1708")
Client.create(identity: "XA424242", first_name:"Marios", last_name:"Pareksigimenos", street:"Trampoukou", street_number: 62, zip_code:"70842", city:"Thessaloniki", credit_card_number:"1780-6540-5187-1342")
