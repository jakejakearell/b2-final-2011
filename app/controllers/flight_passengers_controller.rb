class FlightPassengersController < ApplicationController

  def destroy
    flight_passenger_id = FlightPassenger.where("passenger_id = ? AND flight_id = ?", params[:passenger_id], params[:id]).pluck(:id)
    FlightPassenger.destroy(flight_passenger_id)

    redirect_to flight_path(params[:id])
  end
end
