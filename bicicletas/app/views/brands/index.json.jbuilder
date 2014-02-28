json.array!(@brands) do |brand|
  json.extract! brand, :id, :name, :history, :localizacion
  json.url brand_url(brand, format: :json)
end
