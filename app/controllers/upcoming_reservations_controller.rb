class UpcomingReservationsController < ApplicationController
  def index
  	@upcoming_reservations = UpcomingReservation.all
  end
end
