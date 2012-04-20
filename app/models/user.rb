require 'open-uri'

class User
  def self.all
    open("http://www.amiando.com/api/ticket/find?eventId=51748118&apikey=#{Website::AMIANDO_API_KEY}&version=1").read
  end
end
