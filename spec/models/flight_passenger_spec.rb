require 'rails_helper'

RSpec.describe FlightPassenger, type: :model do
  before(:each) do
    @flight_1 = Flight.create!(number: 123, time: 0700, departure_city:"Las Vegas", arrival_city: "Denver", date: '2000-01-01 00:00:00 -0500')
    @flight_2 = Flight.create!(number: 124, time: 0700, departure_city:"Las Vegas", arrival_city: "Albany", date: '2000-01-01 00:00:00 -0500')
    @flight_3 = Flight.create!(number: 125, time: 0700, departure_city:"Las Vegas", arrival_city: "Zurich", date: '2000-01-01 00:00:00 -0500')

    @seth = Passenger.create!(name: "Seth", age: 20)
    @jeff = Passenger.create!(name: "Jeff", age: 30)
    @jake = Passenger.create!(name: "Jake", age: 1)

    FlightPassenger.create!(flight: @flight_1, passenger: @seth)
    FlightPassenger.create!(flight: @flight_1, passenger: @jeff)
    FlightPassenger.create!(flight: @flight_1, passenger: @jake)
  end

  describe "relationships" do
    it {should belong_to :flight}
    it {should belong_to :passenger}
  end

  describe 'class methods' do
    describe '::find_id' do
      it 'finds the id of the flight passenger colums' do
        expect(FlightPassenger.find_id(@seth.id, @flight_1.id)[0].class).to eq(Integer)
      end
    end
  end
end
