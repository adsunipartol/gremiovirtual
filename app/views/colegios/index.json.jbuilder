json.array!(@colegios) do |colegio|
  json.extract! colegio, :id, :nome
  json.url colegio_url(colegio, format: :json)
end
