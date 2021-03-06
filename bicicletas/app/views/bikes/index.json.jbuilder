json.array!(@bikes) do |bike|
  json.extract! bike, :id, :name, :description, :price
  json.url bike_url(bike, format: :json)
end
