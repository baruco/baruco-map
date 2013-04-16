require 'ostruct'
require 'open-uri'

module Amiando
  class Ticket
    def self.all
      payments = "http://www.amiando.com/api/event/#{Website::AMIANDO_EVENT_ID}/payments?apikey=#{Website::AMIANDO_API_KEY}&version=1"
      tickets = JSON.parse(open(payments).read)['payments'].map do |id|
        begin
          uri = "http://www.amiando.com/api/payment/#{id}/tickets?apikey=#{Website::AMIANDO_API_KEY}&version=1"
          tickets = JSON.parse(open(uri).read)['tickets']
          ticket = tickets.first if tickets
          puts "Ticket: #{ticket}"
          new(ticket)
        rescue
        end
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
