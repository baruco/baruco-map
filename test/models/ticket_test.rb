require "test_helper"

describe Ticket do
  subject { Ticket.new }

  describe "address" do
    it "returns a valid address" do
      subject.city = "Barcelona"
      subject.zip = "08222"
      subject.country = "ES"
      subject.address.must_include "Barcelona"
      subject.address.must_include "08222"
      subject.address.must_include "ES"
    end
  end

  describe "geocode" do
    before do
      subject.city = "Barcelona Spain"
      subject.country = "ES"
      subject.geocode
    end

    it "should set the city to a proper value and return coordinates" do
      subject.city.must_equal "Barcelona"
    end
    
    it "should stablish the proper coordinates" do
      subject.longitude.wont_equal nil
      subject.latitude.wont_equal nil
    end
  end
end
