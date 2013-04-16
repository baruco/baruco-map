class TicketSync
  def initialize(event_id)
    @event_id = event_id
  end

  def sync
    tickets.each do |ticket|
      begin
        persistence = find_persisted_ticket(ticket.id)
        puts "Syncing #{ticket.inspect}"
        persistence.attributes = {
          city: ticket.city,
          zip: ticket.zip,
          country: ticket.country
        }
        persistence.save
      rescue OpenURI::HTTPError
      end
    end
  end

  def find_persisted_ticket(id)
    Ticket.where(identifier: id).first || 
      Ticket.new(identifier: id)
  end

  def tickets
    Amiando::Ticket.all
  end
end
