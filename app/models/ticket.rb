class Ticket < ActiveRecord::Base

  geocoded_by :partial_address do |obj, results|
    if geo = results.first
      obj.city = geo.city
    end
  end

  before_save :geocode

  def address
    [city, zip, country].join(', ')
  end

  def geocode
    results = Geocoder.search(address)
    if geo = results.first
      results = Geocoder.search("#{geo.city}, #{geo.country}")
      result = results.first
      self.longitude = result.longitude
      self.latitude = result.latitude
    end
  end
end
