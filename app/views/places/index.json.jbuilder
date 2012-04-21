# encoding: utf-8
#
json.array!(tickets) do |json, ticket|
  json.city ticket.city
  json.country ticket.country
  json.coordinates [ticket.latitude, ticket.longitude]
end
