
RSpec.describe Flight, type: :model do
  before(:each) do
    @flight_1 = Flight.create!(number: 123, time: 0700, departure_city:"Las Vegas", arrival_city: "Denver", date: '2000-01-01 00:00:00 -0500')
    @flight_2 = Flight.create!(number: 124, time: 0700, departure_city:"Las Vegas", arrival_city: "Albany", date: '2000-01-01 00:00:00 -0500')
    @flight_3 = Flight.create!(number: 125, time: 0700, departure_city:"Las Vegas", arrival_city: "Zurich", date: '2000-01-01 00:00:00 -0500')

    @seth = Passenger.create!(name: "Seth", age: 18)
    @jeff = Passenger.create!(name: "Jeff", age: 30)
    @jake = Passenger.create!(name: "Jake", age: 1)

    FlightPassenger.create!(flight: @flight_1, passenger: @seth)
    FlightPassenger.create!(flight: @flight_1, passenger: @jeff)
    FlightPassenger.create!(flight: @flight_1, passenger: @jake)
  end

  describe "relationships" do
    it {should have_many :flight_passengers}
    it {should have_many(:passengers).through(:flight_passengers) }
  end

  describe 'instance methods' do
    
    describe '#adult_passengers' do
      it 'it returns passengers over 18' do
        expect(@flight_1.adult_passengers.count).to eq(2)
      end
    end

    describe '#average_age' do
      it 'returns the average age of adults' do
        expect(@flight_1.average_age).to eq(24)
      end
    end
  end

  describe "class methods" do
    describe '::flights_alphabetical_by_arrival_city' do
      it 'orders flights by alphabeticaly arrival city' do
        expect(Flight.flights_alphabetical_by_arrival_city[0].arrival_city).to eq("Albany")
        expect(Flight.flights_alphabetical_by_arrival_city[1].arrival_city).to eq("Denver")
        expect(Flight.flights_alphabetical_by_arrival_city[2].arrival_city).to eq("Zurich")
      end
    end
  end
end
