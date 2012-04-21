class Ticket < ActiveRecord::Base

  geocoded_by :partial_address
  before_save :geocode

  def partial_address
    [city, country].join(', ')
  end

  def geocode
    super if !city.blank? && !country.blank?
  end
end
