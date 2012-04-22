require "test_helper"

describe TicketSync do
  subject{ TicketSync.new(Website::AMIANDO_EVENT_ID) }

  describe "#find_persisted_ticket" do
    it "should return a persisted ticket if it exists" do
      Ticket.create(identifier: "ABCD")
      ticket = subject.find_persisted_ticket("ABCD")
      ticket.persisted?.must_equal true
    end

    it "should return a new instance if there's not one" do
    end
  end

  describe "#sync" do
    before do
      Ticket.create(identifier: '1', city: "Barcelona", zip: '80250', country: 'ES')
      subject.stubs(:tickets).returns(tickets)
      subject.sync
    end

    let(:tickets) do
      [OpenStruct.new(id: '1', city: 'Terrassa', zip: "08222", country: 'ES'),
        OpenStruct.new(id: '2', city: 'Warsaw', zip: "05-118", country: 'PL'),]
    end

    let(:ticket1) do
      Ticket.where(identifier: '1').first
    end

    let(:ticket2) do
      Ticket.where(identifier: '2').first
    end

    it "should create new instances of the tickets" do
      Ticket.count.must_equal 2
    end

    it "should assign the correct attributes to the new tickets" do
      ticket2.city.must_equal "Warsaw"
      ticket2.country.must_equal "PL"
    end

    it "should update the tickets with any updated attribute" do
      ticket1.city.must_equal "Terrassa"
      ticket1.country.must_equal "ES"
    end
  end
end
