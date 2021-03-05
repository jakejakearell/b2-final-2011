class FlightPassenger < ApplicationRecord
  belongs_to :flight
  belongs_to :passenger

  def self.find_id(passenger_id, flight_id)
    where("passenger_id = ? AND flight_id = ?", passenger_id, flight_id)
    .pluck(:id)
  end
end
