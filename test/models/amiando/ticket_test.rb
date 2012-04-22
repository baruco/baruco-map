require 'test_helper'

describe Amiando::Ticket do
  describe ".all" do
    it "must return some results" do
      (Amiando::Ticket.all.length > 0).must_equal true
    end
  end

  subject{ Amiando::Ticket.all.last }

  describe "#country" do
    it "returns the country" do
      subject.country.wont_equal nil
    end
  end

  describe "#zip" do
    it "returns the zip code" do
      subject.zip.wont_equal nil
    end
  end

  describe "#city" do
    it "returns the city" do
      subject.city.wont_equal nil
    end
  end
end
