require 'test_helper'

describe Amiando::Ticket do
  describe ".all" do
    # (Amiando::User.all.length > 0).must_equal true
  end

  subject{ Amiando::Ticket.all.sample }

  describe "#country" do
    it "returns the country" do
      puts subject.country
    end
  end
end
