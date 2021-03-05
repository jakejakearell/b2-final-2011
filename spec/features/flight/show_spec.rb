require "rails_helper"

RSpec.describe "As a visitor" do
  before(:each) do
    @flight_1 = Flight.create!(number: 123, time: 0700, departure_city:"Las Vegas", arrival_city: "Denver", date: '2000-01-01 00:00:00 -0500')

    @seth = Passenger.create!(name: "Seth", age: 18)
    @jeff = Passenger.create!(name: "Jeff", age: 30)
    @jake = Passenger.create!(name: "Jake", age: 1)

    FlightPassenger.create!(flight: @flight_1, passenger: @seth)
    FlightPassenger.create!(flight: @flight_1, passenger: @jeff)
    FlightPassenger.create!(flight: @flight_1, passenger: @jake)
  end

  describe "when I visit a flight show page" do
    it "I see the flight's number, date, time, departure city, and arrival city" do

      visit "/flights/#{@flight_1.id}"

      expect(page).to have_content(@flight_1.number)
      expect(page).to have_content(@flight_1.departure_city)
      expect(page).to have_content(@flight_1.arrival_city)
      expect(page).to have_content(@flight_1.date)
      expect(page).to have_content(@flight_1.time)
    end

    it "I see the names of the passengers older than 18" do
      visit "/flights/#{@flight_1.id}"

      expect(page).to have_content(@seth.name)
      expect(page).to have_content(@jeff.name)
      expect(page).to have_no_content(@jake.name)

    end

    it "I see the average age of adults on the plane" do
      visit "/flights/#{@flight_1.id}"

      expect(page).to have_content("24")
    end

    it "I see a button to remove the passenger from the flight" do
      visit "/flights/#{@flight_1.id}"

      expect(page).to have_content(@seth.name)
      expect(page).to have_content(@jeff.name)

      expect(page).to have_button 'remove Seth'
      click_button 'remove Seth'
      expect(page).to have_no_content(@seth.name)

      expect(page).to have_button 'remove Jeff'
      click_button 'remove Jeff'
      expect(page).to have_no_content(@jeff.name)
    end
  end
end
