require "rails_helper"

RSpec.describe "As a visitor" do
  before(:each) do
    @flight_1 = Flight.create!(number: 123, time: 0700, departure_city:"Denver", arrival_city: "Las Vegas", date: '2000-01-01 00:00:00 -0500')
    @flight_2 = Flight.create!(number: 124, time: 0700, departure_city:"Albany", arrival_city: "Las Vegas", date: '2000-01-01 00:00:00 -0500')
    @flight_3 = Flight.create!(number: 125, time: 0700, departure_city:"Zurich", arrival_city: "Las Vegas", date: '2000-01-01 00:00:00 -0500')
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

    xit 'all flights are listed in alphabetical order by departure city (A - Z)' do
      within "#items-ready-to-ship" do
        expect(page.all('.items')[0]).to have_content("Saturday, March 23, 1991")
        expect(page.all('.items')[1]).to have_content("Thursday, January 28, 1993")
        expect(page.all('.items')[2]).to have_content("Friday, January 28, 1994")
        expect(page.all('.items')[3]).to have_content("Thursday, January 28, 2021")
        expect(page.all('.items')[4]).to have_content("")
      end
    end
  end
end
