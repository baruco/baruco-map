require 'ostruct'
require 'open-uri'

module Amiando
  class Ticket
    def self.all
      uri = "http://www.amiando.com/api/ticket/find?eventId=#{Website::AMIANDO_EVENT_ID}&apikey=#{Website::AMIANDO_API_KEY}&version=1"
      JSON.parse(open(uri).read)['ids'].map do |id|
        new(id)
      end
    end

    def initialize(id)
      @id = id
    end

    def id
      @id
    end

    delegate :zip, :city, :country, to: :address

  private

    def address
      Address.new(data.paymentId)
    end

    def data
      return @data if @data
      uri = "http://www.amiando.com/api/ticket/#{@id}?apikey=#{Website::AMIANDO_API_KEY}&version=1"
      @data ||= OpenStruct.new(JSON.parse(open(uri).read)['ticket'])
    end

    class Address
      def initialize(id)
        @id = id
      end

      delegate :city, :country, to: :data

      def zip
        data.zipCode
      end

      def data
        return @data if @data
        uri = "http://www.amiando.com/api/payment/#{@id}/address/buyer?apikey=#{Website::AMIANDO_API_KEY}&version=1"
        @data ||= OpenStruct.new(JSON.parse(open(uri).read)['address'])
      end
    end
  end
end
