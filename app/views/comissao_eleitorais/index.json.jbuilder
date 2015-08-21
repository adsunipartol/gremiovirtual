json.array!(@comissao_eleitorais) do |comissao_eleitoral|
  json.extract! comissao_eleitoral, :id, :gremio_id
  json.url comissao_eleitoral_url(comissao_eleitoral, format: :json)
end
