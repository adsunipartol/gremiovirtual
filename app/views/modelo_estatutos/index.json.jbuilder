json.array!(@modelo_estatutos) do |modelo_estatuto|
  json.extract! modelo_estatuto, :id, :comissao_pro_gremio_id, :aprovado, :estatuto
  json.url modelo_estatuto_url(modelo_estatuto, format: :json)
end
