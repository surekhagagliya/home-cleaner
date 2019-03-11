json.array! @cities do |city|
  json.id city.id
  json.name city.name
  json.user do
    json.id city.user.id
    json.email city.user.email
  end
end