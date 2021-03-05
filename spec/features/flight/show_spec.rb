require "rails_helper"

RSpec.describe "As a visitor" do
  before(:each) do
    @flight_1 = Flight.create!(number: 123, time: 0700, departure_city:"Las Vegas", arrival_city: "Denver", date: '2000-01-01 00:00:00 -0500')
    @flight_2 = Flight.create!(number: 124, time: 0700, departure_city:"Las Vegas", arrival_city: "Albany", date: '2000-01-01 00:00:00 -0500')
    @flight_3 = Flight.create!(number: 125, time: 0700, departure_city:"Las Vegas", arrival_city: "Zurich", date: '2000-01-01 00:00:00 -0500')
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
  end
end
