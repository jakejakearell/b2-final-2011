class Flight <ApplicationRecord
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers

  def adult_passengers
    passengers
    .where("age >= 18")
  end

  def average_age
    adult_passengers
    .average(:age)
  end

  def self.flights_alphabetical_by_arrival_city
    Flight.order(:arrival_city)
  end
end
