# encoding: utf-8
#
json.array!(tickets) do |json, ticket|
  json.coordinates [ticket.latitude, ticket.longitude]
end
