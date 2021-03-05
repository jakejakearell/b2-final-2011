class FlightPassengersController < ApplicationController

  def destroy
    flight_passenger_id = FlightPassenger.find_id(params[:passenger_id], params[:id])
    FlightPassenger.destroy(flight_passenger_id)

    redirect_to flight_path(params[:id])
  end
end
