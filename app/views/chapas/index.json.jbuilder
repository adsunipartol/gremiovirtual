json.array!(@chapas) do |chapa|
  json.extract! chapa, :id, :nome
  json.url chapa_url(chapa, format: :json)
end
