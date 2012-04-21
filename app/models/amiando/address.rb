require 'ostruct'
require 'open-uri'

module Amiando
  class Address

    def initialize(id)
      @id = id
    end

    def name
      "#{data.firstName} #{data.lastName}"
    end

    def city
      data.city
    end

    def country
      data.country
    end

    def street
      data.street
    end

    def zip
      data.zipCode
    end

    def full
      [street, city, country].join(', ')
    end

    def partial
      [city, country].join(', ')
    end

    def data
      return @data if @data
      uri = "http://www.amiando.com/api/payment/#{@id}/address/buyer?apikey=#{Website::AMIANDO_API_KEY}&version=1"
      @data ||= OpenStruct.new(JSON.parse(open(uri).read)['address'])
    end

  end
end
