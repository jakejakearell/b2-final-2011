class FlightsController < ApplicationController
  def index
    @flights = Flight.flights_alphabetical_by_arrival_city
  end

  def show
    @flight = Flight.find(params[:id])
  end 
end
