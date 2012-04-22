class Ticket < ActiveRecord::Base

  before_save :geocode

  def address
    [city, zip, country].compact.join(', ')
  end

  def geocode
    results = Geocoder.search(address)
    if geo = results.first
      results = Geocoder.search("#{geo.city}, #{geo.country}")
      self.city = geo.city
      if result = results.first
        self.longitude = result.longitude
        self.latitude = result.latitude
      end
    end
  end
end
