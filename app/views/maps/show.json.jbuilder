# encoding: utf-8
#
json.array!(users) do |json, registration|
  json.coordinates [registration[:latitude], registration[:longitude]]
end
