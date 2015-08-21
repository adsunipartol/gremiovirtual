json.array!(@comissao_pro_gremios) do |comissao_pro_gremio|
  json.extract! comissao_pro_gremio, :id, :colegio_id, :ativa
  json.url comissao_pro_gremio_url(comissao_pro_gremio, format: :json)
end
