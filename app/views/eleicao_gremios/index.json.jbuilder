json.array!(@eleicao_gremios) do |eleicao_gremio|
  json.extract! eleicao_gremio, :id
  json.url eleicao_gremio_url(eleicao_gremio, format: :json)
end
