# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
flight_1 = Flight.create!(number: 123, time: 0700, departure_city:"Las Vegas", arrival_city: "Denver", date: '2000-01-01 00:00:00 -0500')
flight_2 = Flight.create!(number: 124, time: 0700, departure_city:"Las Vegas", arrival_city: "Albany", date: '2000-01-01 00:00:00 -0500')
flight_3 = Flight.create!(number: 125, time: 0700, departure_city:"Las Vegas", arrival_city: "Zurich", date: '2000-01-01 00:00:00 -0500')

seth = Passenger.create!(name: "Seth", age: 20)
jeff = Passenger.create!(name: "Jeff", age: 30)
jake = Passenger.create!(name: "Jake", age: 1)

item_1 = FlightPassenger.create!(flight: flight_1, passenger: seth)
item_2 = FlightPassenger.create!(flight: flight_1, passenger: jeff)
item_3 = FlightPassenger.create!(flight: flight_1, passenger: jake)
