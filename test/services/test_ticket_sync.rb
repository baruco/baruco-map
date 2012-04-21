require "test_helper"

describe TicketSync do
  subject{ TicketSync.new(Website::AMIANDO_EVENT_ID) }

  describe "#sync" do
    it "should create new instances of the tickets" do
      subject.sync
    end
  end
end
