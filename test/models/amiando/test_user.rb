require 'test_helper'

describe Amiando::User do
  describe ".all" do
    # (Amiando::User.all.length > 0).must_equal true
  end

  subject{ Amiando::User.all.sample }

  describe "#address" do
    it "returns the address" do
      puts subject.partial_address
    end
  end
end
