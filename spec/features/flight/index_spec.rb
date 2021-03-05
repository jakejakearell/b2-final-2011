require "rails_helper"

RSpec.describe "As a visitor" do
  before(:each) do
    @flight_1 = Flight.create!(number: 123, time: 0700, departure_city:"Las Vegas", arrival_city: "Denver", date: '2000-01-01 00:00:00 -0500')
    @flight_2 = Flight.create!(number: 124, time: 0700, departure_city:"Las Vegas", arrival_city: "Albany", date: '2000-01-01 00:00:00 -0500')
    @flight_3 = Flight.create!(number: 125, time: 0700, departure_city:"Las Vegas", arrival_city: "Zurich", date: '2000-01-01 00:00:00 -0500')
  end

  describe "when I visit the flights index page" do
    it "I see each flight in the system including its number, departure city, and arrival city" do

      visit "/flights/"

      expect(page).to have_content(@flight_1.number)
      expect(page).to have_content(@flight_1.departure_city)
      expect(page).to have_content(@flight_1.arrival_city)

      expect(page).to have_content(@flight_2.number)
      expect(page).to have_content(@flight_2.departure_city)
      expect(page).to have_content(@flight_2.arrival_city)

      expect(page).to have_content(@flight_3.number)
      expect(page).to have_content(@flight_3.departure_city)
      expect(page).to have_content(@flight_3.arrival_city)

    end

    it 'all flights are listed in alphabetical order by departure city (A - Z)' do
      visit "/flights/"

      within "#flights-arrival_city" do
        expect(page.all('.flights')[0]).to have_content("Albany")
        expect(page.all('.flights')[1]).to have_content("Denver")
        expect(page.all('.flights')[2]).to have_content("Zurich")
      end
    end
  end
end
