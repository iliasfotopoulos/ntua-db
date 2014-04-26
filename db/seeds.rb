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