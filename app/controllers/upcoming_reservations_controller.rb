class UpcomingReservationsController < ApplicationController
  def index
  	@upcoming_reservations = UpcomingReservation.all
  	@upcoming_reservations_updatable = UpcomingReservationUpdatable.all
  end
end
