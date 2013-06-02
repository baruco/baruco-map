class PlacesController < ApplicationController
  respond_to :json
  helper_method :tickets

private

  def tickets
    @tickets ||= Ticket.geocoded
  end
end
