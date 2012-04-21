require 'ostruct'

module Amiando
  class User

    def self.all
      uri = "http://www.amiando.com/api/ticket/find?eventId=51748118&apikey=#{Website::AMIANDO_API_KEY}&version=1"
      JSON.parse(open(uri).read)['ids'].map do |id|
        new(id)
      end
    end

    def initialize(id)
      @id = id
    end

    def name
      address.name
    end

    def full_address
      address.full
    end

    def partial_address
      address.full
    end

  private

    def address
      Address.new(data.paymentId)
    end

    def data
      return @data if @data
      uri = "http://www.amiando.com/api/ticket/#{@id}?apikey=#{Website::AMIANDO_API_KEY}&version=1"
      @data ||= OpenStruct.new(JSON.parse(open(uri).read)['ticket'])
    end

  end
end
