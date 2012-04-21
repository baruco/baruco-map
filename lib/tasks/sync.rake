task :sync_tickets => :environment do
  TicketSync.new(Website::AMIANDO_EVENT_ID).sync
end
