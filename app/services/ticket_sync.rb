class TicketSync
  def initialize(event_id)
    @event_id = event_id
  end

  def sync
    Amiando::Ticket.all.each do |ticket|
      persistence = find_persisted_ticket(ticket)
      puts "Persisting ticket #{ticket.inspect}..."
      persistence.attributes = {
        city: ticket.city,
        country: ticket.country
      }
      persistence.save
    end
  end

  def find_persisted_ticket(ticket)
    Ticket.where(identifier: ticket.id).first || 
      Ticket.new(identifier: ticket.id)
  end
end
