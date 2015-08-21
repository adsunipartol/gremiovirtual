json.array!(@assembleia_gerais) do |assembleia_geral|
  json.extract! assembleia_geral, :id, :colegio_id
  json.url assembleia_geral_url(assembleia_geral, format: :json)
end
