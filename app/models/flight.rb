class Flight <ApplicationRecord
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def self.flights_alphabetical_by_arrival_city
    Flight.order(:arrival_city)
  end
end
