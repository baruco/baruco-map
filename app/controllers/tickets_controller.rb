class TicketsController < ApplicationController
  respond_to :json
  helper_method :tickets

private

  def tickets
    @tickets ||= Ticket.scoped
  end
end