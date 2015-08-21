json.array!(@gremios) do |gremio|
  json.extract! gremio, :id, :nome, :colegio_id
  json.url gremio_url(gremio, format: :json)
end
